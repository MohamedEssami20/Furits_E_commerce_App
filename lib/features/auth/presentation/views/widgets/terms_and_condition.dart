import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_checkbox.dart';
import 'package:fruits_hub/generated/l10n.dart';

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
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).byCreatingAccount,
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xff949D9E),
                  ),
                ),
                TextSpan(
                  text: S.of(context).termsAndConditions,
                  style: TextStyles.semiBold13
                      .copyWith(color: MyColors.kLightPrimaryColor),
                ),
                const TextSpan(text: " ", style: TextStyles.semiBold13),
                TextSpan(
                  text: S.of(context).specialText,
                  style: TextStyles.semiBold13
                      .copyWith(color: MyColors.kLightPrimaryColor),
                ),
                const TextSpan(text: " ", style: TextStyles.semiBold13),
                TextSpan(
                  text: S.of(context).our,
                  style: TextStyles.semiBold13
                      .copyWith(color: MyColors.kLightPrimaryColor),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
