import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

import '../../../../../core/utils/app_text_style.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(16, 0),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "من خلال إنشاء حساب فإنك توافق على",
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xff949D9E),
                  ),
                ),
                TextSpan(
                  text: " الشروط والأحكام",
                  style: TextStyles.semiBold13
                      .copyWith(color: MyColors.kLightPrimaryColor),
                ),
                const TextSpan(text: " ", style: TextStyles.semiBold13),
                TextSpan(
                  text: "الخاصة",
                  style: TextStyles.semiBold13
                      .copyWith(color: MyColors.kLightPrimaryColor),
                ),
                const TextSpan(text: " ", style: TextStyles.semiBold13),
                TextSpan(
                  text: "بنا",
                  style: TextStyles.semiBold13
                      .copyWith(color: MyColors.kLightPrimaryColor),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
