import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/utils/helper.dart';
import '../../../../layout/cubit/cubit.dart';

class AddPhotosAndTagsButtons extends StatelessWidget {
  const AddPhotosAndTagsButtons({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final SocialAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextButton(
            onPressed: () => Helper.buildBottomSheet(
              type: "Post",
              context: context,
              onPressedCamera: () => cubit.getPostImage(
                source: ImageSource.camera,
              ),
              onPressedGallery: () => cubit.getPostImage(
                source: ImageSource.gallery,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.image,
                  color: AppColors.primaryColor,
                  size: 22,
                ),
                SizedBox(width: 5),
                Text(
                  "Add photo",
                  style: TextStyle(fontSize: 16, color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "# Tags",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
