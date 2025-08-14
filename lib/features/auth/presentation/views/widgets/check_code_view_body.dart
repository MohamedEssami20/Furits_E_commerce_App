import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart' show TextStyles;
import 'package:fruits_hub/features/auth/presentation/views/widgets/code_input_field.dart';

import 'check_code_verification_builder.dart';

class CheckCodeViewBody extends StatelessWidget {
  const CheckCodeViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "أدخل الرمز الذي أرسلناه إلى عنوان بريد الكتروني $email",
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CodeInputField(),
          const SizedBox(
            height: 30,
          ),
          CheckCodeVerificationBuilder(
            onPressed: () {
              // validate form;
              // if valid then trigger check verification code ;
              
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'إعادة إرسال الرمز',
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.lightSecondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
