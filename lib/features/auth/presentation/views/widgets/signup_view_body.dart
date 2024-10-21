import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_condition.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomTextFormFiled(
              hintText: "الاسم كامل",
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormFiled(
              hintText: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormFiled(
              hintText: "كلمة المرور",
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TermsAndCondition(),
            const SizedBox(
              height: 35,
            ),
            CustomButton(onPressed: () {}, title: "إنشاء حساب جديد"),
            const SizedBox(
              height: 40,
            ),
            const HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
