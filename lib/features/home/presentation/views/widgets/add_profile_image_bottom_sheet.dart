import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/features/home/presentation/manager/edit_user_info_cubit/user_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class AddProfileImageBottomSheet extends StatefulWidget {
  const AddProfileImageBottomSheet({
    super.key,
  });

  @override
  State<AddProfileImageBottomSheet> createState() =>
      _AddProfileImageBottomSheetState();
}

class _AddProfileImageBottomSheetState
    extends State<AddProfileImageBottomSheet> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is EditUserImageSuccess) {
          Navigator.of(context).pop();
          buildErrorSnackBar(context, S.of(context).pictureIsChanged);
        }
        if (state is EditUserImageFailure) {
          Navigator.of(context).pop();
          buildErrorSnackBar(context, S.of(context).errorMessage);
        }
      },
      child: BottomSheet(
        backgroundColor: Colors.white,
        onClosing: () {},
        builder: (context) => Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).chooseFrom,
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF1B5E37),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await pickImageFromCamera(context).then((context) {
                          updateImage();
                        }).catchError((error) {
                          log("error to pick image from camer = ${error.toString()}");
                        });
                      },
                      label: Text(S.of(context).fromCamera),
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.lightSecondaryColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await pickImageFromGallery(context).then((context) {
                          updateImage();
                        }).catchError((error) {
                          log("error to pick image from gallery = ${error.toString()}");
                        });
                      },
                      label: Text(S.of(context).fromGallery),
                      icon: const Icon(
                        Icons.folder_outlined,
                        color: AppColors.lightSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);

      log("image path from camera = ${image!.path}");
    }
  }

  Future<void> pickImageFromGallery(BuildContext context) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      log("image path from gallery = ${image!.path}");
    }
  }

  // create method that trigger the cubit to update user image
  void updateImage() => context.read<UserCubit>().updateUserImage(
        file: image!,
        genralErrorMessage: S.of(context).errorMessage,
      );
}
