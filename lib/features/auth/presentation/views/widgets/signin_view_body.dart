import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

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
              textInputType: TextInputType.visiblePassword,
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
              height: 40,
            ),
            CustomButton(onPressed: () {}, title: "تسجيل الدخول"),
            const SizedBox(
              height: 20,
            ),
            const DontHaveAnAccountWidget(),
            const SizedBox(
              height: 40,
            ),
            const OrDividerWidget(),
            const SizedBox(
              height: 20,
            ),
            SocialLoginButton(
              title: "تسجيل بواسطة جوجل",
              onPressed: () {},
              image: Assets.assetsImagesGoogleIcon,
            ),
            const SizedBox(
              height: 18,
            ),
            SocialLoginButton(
              title: "تسجيل بواسطة أبل",
              onPressed: () {},
              image: Assets.assetsImagesAppleIcons,
            ),
            const SizedBox(
              height: 18,
            ),
            SocialLoginButton(
              title: "تسجيل بواسطة فيسبوك",
              onPressed: () {},
              image: Assets.assetsImagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
