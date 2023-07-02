import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:social_app/core/utils/helper.dart';
import 'package:social_app/core/widgets/custom_text_button.dart';
import 'package:social_app/features/new_post/presentation/widgets/new_post_view_body.dart';

import '../../../../core/models/user_model.dart';
import '../../../../layout/presenetation/view/manager/app_cubit.dart';
import '../../../../layout/presenetation/view/manager/app_states.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.getObject(context);
        UserModel model = Helper.model!;
        TextEditingController textController = TextEditingController();
        return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          appBar: buildAppBar(context, cubit, textController),
          body: NewPostViewBody(
            cubit: cubit,
            model: model,
            textController: textController,
            state: state,
          ),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context, AppCubit cubit,
      TextEditingController textController) {
    return Helper.appBarBuilder(
      context: context,
      title: "Create Post",
      centerTitle: false,
      actions: <Widget>[
        CustomTextButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            if (cubit.postImage == null) {
              cubit.createPost(
                date: Helper.getDate(),
                time: DateFormat.jm().format(DateTime.now()),
                text: textController.text,
              );
            } else {
              cubit.uploadPostImage(
                date: Helper.getDate(),
                time: DateFormat.jm().format(DateTime.now()),
                text: textController.text,
              );
            }
          },
          title: 'POST',
        ),
      ],
    );
  }
}