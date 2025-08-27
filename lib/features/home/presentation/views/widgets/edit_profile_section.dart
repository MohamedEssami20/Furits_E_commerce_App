import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_verification_button.dart';
import 'package:fruits_hub/features/home/domain/entities/edit_user_info_entity.dart';
import 'package:fruits_hub/features/home/presentation/manager/edit_user_info_cubit/user_cubit.dart';
import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../manager/get_user_cubit/get_user_cubit.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';
import 'builder/send_editing_user_info_builder.dart';
import 'edit_profile_info_fields.dart';
import 'show_alert_add_current_password.dart';

class EditProfileSection extends StatefulWidget {
  const EditProfileSection({super.key});

  @override
  State<EditProfileSection> createState() => _EditProfileSectionState();
}

class _EditProfileSectionState extends State<EditProfileSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> alertFormKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late UserEntity? userEntity;

  @override
  void initState() {
    userEntity = context.read<GetUserCubit>().userEntity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(context,
                title: "تعديل الملف الشخصي",
                showBackButton: true,
                showNotification: false, onBackPress: () {
              context.read<ProfileViewCubit>().changeIndex(0);
            }),
            const SizedBox(
              height: 20,
            ),
            const Text("المعلومات الشخصية", style: TextStyles.semiBold13),
            EditProfileInfoTextFields(
                userEntity: userEntity!, controllers: _controllers),
            // add text that tell user that when he change email he will receive a mail to confirm;
            Text(
              "في حالة تغيير البريد الالكتروني سوف يتم ارسال رابط تاكيد البريد الالكتروني على البريد الالكتروني الجديد",
              style: TextStyles.semiBold13.copyWith(
                color: Colors.black,
              ),
            ),
            CustomVerificationButton(
              onPressed: () {
                final newName = _controllers[0].text.trim();
                final newEmail = _controllers[1].text.trim();
                final newPassword = _controllers[3].text.trim();
                final currentPassword = _controllers[2].text.trim();
                final newConfirmPassword = _controllers[4].text.trim();
                // check who changed;
                bool isNameChanged = newName != userEntity!.userName;
                bool isEmailChanged = newEmail != userEntity!.email;
                bool isNewPasswordChanged = currentPassword.isNotEmpty &&
                    newPassword.isNotEmpty &&
                    newConfirmPassword.isNotEmpty;
                if (_controllers[1].text.isNotEmpty &&
                    _controllers[2].text.isEmpty) {
                  // build dialog that ask user to enter password;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ShowAlertToAddCurrentPassword(
                        controllers: _controllers,
                        formKey: alertFormKey,
                        email: newEmail,
                        name: newName,
                      );
                    },
                  );
                } else {
                  if (!isNameChanged &&
                      !isEmailChanged &&
                      !isNewPasswordChanged) {
                    context.read<ProfileViewCubit>().changeIndex(0);
                  } else if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    EditUserInfoEntity userInfoEntity = EditUserInfoEntity(
                      name: newName,
                      email: newEmail,
                      newPassword: newPassword,
                      oldPassword: currentPassword,
                    );
                    context
                        .read<UserCubit>()
                        .updateUserInfo(userInfoEntity: userInfoEntity);
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                }
              },
              // check if not any changed;

              title: const SendEditingUserInfoBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
