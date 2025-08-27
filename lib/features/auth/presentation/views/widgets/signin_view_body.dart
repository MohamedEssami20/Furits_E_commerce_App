import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/Widgets/password_text_field.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';

import '../../manager/signin_cubit/signin_cubit.dart';
import '../forget_password_view.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  email = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'البريد الالكتروني مطلوب';
                }
                  return null;
                },
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ForgetPasswordView.routeName);
                    },
                    child: Text(
                      "نسيت كلمة المرور؟",
                      style: TextStyles.semiBold13
                          .copyWith(color: MyColors.kLightPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await context
                        .read<SigninCubit>()
                        .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
                title: "تسجيل الدخول",
              ),
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
                onPressed: () async {
                  await context.read<SigninCubit>().signInWithGoogle();
                },
                image: Assets.assetsImagesGoogleIcon,
              ),
              const SizedBox(
                height: 18,
              ),
              Platform.isIOS
                  ? Column(
                      children: [
                        SocialLoginButton(
                          title: "تسجيل بواسطة أبل",
                          onPressed: () {},
                          image: Assets.assetsImagesAppleIcons,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    )
                  : const SizedBox(),
              SocialLoginButton(
                title: "تسجيل بواسطة فيسبوك",
                onPressed: () async {
                  await context.read<SigninCubit>().signInWithFacebook();
                },
                image: Assets.assetsImagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
