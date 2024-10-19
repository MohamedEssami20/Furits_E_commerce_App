import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
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
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyles.semiBold13
                      .copyWith(color: MyColors.kLightPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            CustomButton(onPressed: () {}, title: "تسجيل الدخول"),
            const SizedBox(
              height: 20,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "لا تمتلك حساب؟ ",
                    style: TextStyles.bold16.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                  TextSpan(
                    text: "قم بإنشاء حساب",
                    style: TextStyles.bold16
                        .copyWith(color: MyColors.kPrimaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
