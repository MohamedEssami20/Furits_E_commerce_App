import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomTextFormFiled(
              hintText: "الاسم كامل",
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormFiled(
              hintText: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormFiled(
              hintText: "كلمة المرور",
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xffC9CECF),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
