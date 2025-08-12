import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart' show TextStyles;

import '../check_code_view.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            'لا تقلق ، ما عليك سوى كتابة البريد الالكتروني وسنرسل رمز التحقق.',
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormFiled(
            hintText: "البريد الالكتروني ",
            textInputType: TextInputType.text,
            onSaved: (value) {
              email = value!;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  CheckCodeView.routeName,
                );
              },
              title: "نسيت كلمة المرور"),
        ],
      ),
    );
  }
}
