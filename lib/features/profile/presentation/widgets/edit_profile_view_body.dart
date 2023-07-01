import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_app/layout/cubit/states.dart';

import '../../../../core/models/user_model.dart';
import '../../../../layout/cubit/cubit.dart';
import 'confirm_editing_buttons.dart';
import 'edit_cover_image.dart';
import 'edit_profile_image.dart';
import 'edit_user_info.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({
    Key? key,
    required this.coverImage,
    required this.userModel,
    required this.cubit,
    required this.profileImage,
    required this.nameController,
    required this.phoneController,
    required this.bioController,
    required this.formKey,
    required this.state,
  }) : super(key: key);

  final File? coverImage;
  final UserModel userModel;
  final SocialAppCubit cubit;
  final SocialAppStates state;
  final File? profileImage;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController bioController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 220,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: EditCoverImage(
                      coverImage: coverImage,
                      userModel: userModel,
                      cubit: cubit,
                    ),
                  ),
                  EditProfileImage(
                    profileImage: profileImage,
                    userModel: userModel,
                    cubit: cubit,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // if (cubit.profileImage != null && cubit.coverImage != null)
            ConfirmEditingButtons(
              cubit: cubit,
              nameController: nameController,
              phoneController: phoneController,
              bioController: bioController,
              state: state,
            ),
            // const SizedBox(height: 20),
            EditUserInfo(
              formKey: formKey,
              nameController: nameController,
              bioController: bioController,
              phoneController: phoneController,
            ),
          ],
        ),
      ),
    );
  }
}
