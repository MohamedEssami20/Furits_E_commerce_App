import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/get_user_data.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';

class EditProfileSection extends StatefulWidget {
  const EditProfileSection({super.key});

  @override
  State<EditProfileSection> createState() => _EditProfileSectionState();
}

class _EditProfileSectionState extends State<EditProfileSection> {
  bool currentPassword = false;
  bool newPassword = false;
  bool confirmPassword = false;
  @override
  Widget build(BuildContext context) {
    final UserEntity userEntity = getUserData();
    return Column(
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
        CustomTextFormFiled(
          hintText: userEntity.userName,
          textInputType: TextInputType.name,
        ),
        CustomTextFormFiled(
          hintText: userEntity.email,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(),
        Text(
          textAlign: TextAlign.right,
          'تغيير كلمة المرور',
          style: TextStyles.semiBold13.copyWith(
            color: Colors.black,
          ),
        ),
        CustomTextFormFiled(
          hintText: 'كلمة المرور الحالية',
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
          hintText: 'كلمة المرور الجديدة',
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
          hintText: 'تأكيد كلمة المرور الجديدة',
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
        CustomButton(onPressed: () {}, title: "حفظ التغييرات"),
      ],
    );
  }
}
