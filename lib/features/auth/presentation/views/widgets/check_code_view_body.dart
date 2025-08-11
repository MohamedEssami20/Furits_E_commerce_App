import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart' show TextStyles;

class CheckCodeViewBody extends StatelessWidget {
  const CheckCodeViewBody({super.key});

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
            "أدخل الرمز الذي أرسلناه إلى عنوان بريد  Maxxx@email.com",
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(onPressed: () {}, title: "تحقق من الرمز"),
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
