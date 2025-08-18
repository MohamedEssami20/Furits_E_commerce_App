import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';

class EditProfileSection extends StatelessWidget {
  const EditProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildAppBar(context,
            title: "تعديل الملف الشخصي",
            showBackButton: true,
            showNotification: false, onBackPress: () {
          context.read<ProfileViewCubit>().changeIndex(0);
        }),
        const CustomTextFormFiled(
            hintText: "الاسم", textInputType: TextInputType.name),
        const CustomTextFormFiled(
            hintText: "رقم الجوال", textInputType: TextInputType.phone),
        const CustomTextFormFiled(
            hintText: "البريد الالكتروني",
            textInputType: TextInputType.emailAddress),
      ],
    );
  }
}
