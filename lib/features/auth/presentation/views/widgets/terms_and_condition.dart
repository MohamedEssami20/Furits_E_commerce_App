import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_checkbox.dart';

import '../../../../../core/utils/app_text_style.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key, required this.onCahanged});
  final ValueChanged<bool> onCahanged;
  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool termsAndCondition = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          isChecked: termsAndCondition,
          onChanged: (value) {
            termsAndCondition = value!;
            widget.onCahanged(value);
            setState(() {});
          },
        ),
        const SizedBox(width: 10),
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
    );
  }
}
