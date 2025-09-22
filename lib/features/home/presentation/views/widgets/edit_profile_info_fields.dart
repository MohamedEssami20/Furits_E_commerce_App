import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart' show TextStyles;

import '../../../../../core/utils/Widgets/custom_text_form_filed.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/domain/entity/user_entity.dart';

class EditProfileInfoTextFields extends StatefulWidget {
  const EditProfileInfoTextFields(
      {super.key, required this.userEntity, required this.controllers});
  final UserEntity userEntity;
  final List<TextEditingController> controllers;

  @override
  State<EditProfileInfoTextFields> createState() =>
      _EditProfileInfoTextFieldsState();
}

class _EditProfileInfoTextFieldsState extends State<EditProfileInfoTextFields> {
  bool currentPassword = false;
  bool newPassword = false;
  bool confirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        CustomTextFormFiled(
          controller: widget.controllers[0],
          hintText: widget.userEntity.userName,
          textInputType: TextInputType.name,
        ),
        CustomTextFormFiled(
            controller: widget.controllers[1],
            hintText: widget.userEntity.email,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(value!) && value.isNotEmpty) {
                return S.of(context).emailNotValid;
              } else if (value == widget.userEntity.email) {
                return S.of(context).notChangeEmailAlreadyExist;
              }
              return null;
            }),
        const SizedBox(
          height: 16,
        ),
        Text(
          textAlign: TextAlign.right,
          S.of(context).changePassword,
          style: TextStyles.semiBold13.copyWith(
            color: Colors.black,
          ),
        ),
        CustomTextFormFiled(
          controller: widget.controllers[2],
          validator: (value) {
            if (widget.controllers[3].text.isNotEmpty &&
                widget.controllers[4].text.isNotEmpty &&
                value!.isEmpty) {
              return S.of(context).pleaseEnterCurrentPassword;
            }
            return null;
          },
          hintText: S.of(context).currentPassword,
          textInputType: TextInputType.visiblePassword,
          obscureText: currentPassword,
          suffixIcon: IconButton(
            onPressed: () => setState(() => currentPassword = !currentPassword),
            icon: currentPassword
                ? const Icon(Icons.visibility_off_rounded)
                : const Icon(
                    Icons.visibility_rounded,
                    color: Color(0xffC9CECF),
                  ),
          ),
        ),
        CustomTextFormFiled(
          controller: widget.controllers[3],
          validator: (value) {
            if (widget.controllers[2].text.isNotEmpty && value!.isEmpty) {
              return S.of(context).pleaseEnterNewPassword;
            } else if (value!.length < 8 && value.isNotEmpty) {
              return S.of(context).passwordLength;
            }
            return null;
          },
          hintText: S.of(context).newPassword,
          textInputType: TextInputType.visiblePassword,
          obscureText: newPassword,
          suffixIcon: IconButton(
            onPressed: () => setState(() => newPassword = !newPassword),
            icon: newPassword
                ? const Icon(Icons.visibility_off_rounded)
                : const Icon(
                    Icons.visibility_rounded,
                    color: Color(0xffC9CECF),
                  ),
          ),
        ),
        CustomTextFormFiled(
          controller: widget.controllers[4],
          validator: (value) {
            if (widget.controllers[3].text.isNotEmpty && value!.isEmpty) {
              return S.of(context).pleaseEnterConfirmNewPassword;
            } else if (widget.controllers[3].text !=
                widget.controllers[4].text) {
              return S.of(context).passwordNotMatch;
            }
            return null;
          },
          hintText: S.of(context).confirmNewPassword,
          textInputType: TextInputType.visiblePassword,
          obscureText: confirmPassword,
          suffixIcon: IconButton(
            onPressed: () => setState(() => confirmPassword = !confirmPassword),
            icon: confirmPassword
                ? const Icon(Icons.visibility_off_rounded)
                : const Icon(
                    Icons.visibility_rounded,
                    color: Color(0xffC9CECF),
                  ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
