import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/utils/Widgets/custom_text_form_filed.dart';
import '../../../domain/entities/edit_user_info_entity.dart';
import '../../manager/edit_user_info_cubit/user_cubit.dart';

class ShowAlertToAddCurrentPassword extends StatelessWidget {
  const ShowAlertToAddCurrentPassword({
    super.key,
    required List<TextEditingController> controllers,
    required this.formKey,
    required this.email,
    required this.name,
  }) : _controllers = controllers;

  final List<TextEditingController> _controllers;
  final GlobalKey<FormState> formKey;
  final String email, name;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("تغيير البريد الالكتروني"),
      content: const Text(
          "لتغيير البريد الالكتروني يجب ادخال كلمة المرور الحالية وسوف يتم أرسال رابط تأكيد البريد الالكتروني على البريد الالكتروني الجديد"),
      actions: [
        Form(
          key: formKey,
          child: CustomTextFormFiled(
            hintText: "كلمة المرور الحالية",
            textInputType: TextInputType.visiblePassword,
            controller: _controllers[5],
            validator: (value) {
              if (value!.isEmpty) {
                return 'كلمة المرور الحالية مطلوبة';
              }
              return null;
            },
          ),
        ),
        Row(
          children: [
            TextButton(
              child: const Text("الغاء"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("تغيير"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  EditUserInfoEntity userInfoEntity = EditUserInfoEntity(
                    name: name,
                    email: email,
                    newPassword: "",
                    oldPassword: _controllers[5].text,
                  );
                  context.read<UserCubit>().updateUserInfo(
                        userInfoEntity: userInfoEntity,
                        genralErrorMessage: S.of(context).errorMessage,
                      );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
