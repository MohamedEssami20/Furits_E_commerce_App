import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart' show TextStyles;
import 'package:fruits_hub/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:provider/provider.dart';
import 'reset_password_button_builder.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  String email = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
            'لا تقلق ، ما عليك سوى كتابة البريد الالكتروني وسنرسل لك رابط استعادة كلمة المرور .',
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: CustomTextFormFiled(
              hintText: "البريد الالكتروني ",
              textInputType: TextInputType.text,
              onSaved: (value) {
                email = value!;
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ResetPasswordButtonBuilder(
            formKey: formKey,
            email: email,
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                await context
                    .read<ResetPasswordCubit>()
                    .sendPasswordResetEmail(email: email);
              }
            },
          ),
        ],
      ),
    );
  }
}
