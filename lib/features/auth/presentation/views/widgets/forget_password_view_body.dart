import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/generate_code.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart' show TextStyles;
import '../../manager/reset_password_cubit/reset_password_cubit.dart';
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
            'لا تقلق ، ما عليك سوى كتابة البريد الالكتروني وسنرسل رمز التحقق.',
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
            onPressed: () {
              final int code = generateCode();
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<ResetPasswordCubit>().sendCodeVerification(
                      email: email,
                      code: code,
                    );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
