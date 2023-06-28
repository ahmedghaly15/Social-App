import 'package:flutter/material.dart';
import 'package:social_app/features/feeds/presentation/view/comments_view.dart';

import '../../../../core/global/app_navigator.dart';
import '../../../../core/global/app_styles.dart';
import '../../../../core/models/post_model.dart';
import '../../../../layout/cubit/cubit.dart';

class WriteCommentInputField extends StatelessWidget {
  const WriteCommentInputField({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    SocialAppCubit.getObject(context).model!.image!,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    AppNavigator.navigateTo(
                      screen: CommentsView(
                        postId: model.postId,
                        postUid: model.uId,
                      ),
                    );
                  },
                  child: Text(
                    "Write a comment...",
                    style: AppStyles.bodySmall.copyWith(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}