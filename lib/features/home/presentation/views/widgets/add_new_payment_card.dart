import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_checkbox.dart';

import '../../../../../generated/l10n.dart';

class AddNewPaymentCard extends StatefulWidget {
  const AddNewPaymentCard({super.key});

  @override
  State<AddNewPaymentCard> createState() => _AddNewPaymentCardState();
}

class _AddNewPaymentCardState extends State<AddNewPaymentCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CustomTextFormFiled(
            hintText: S.of(context).cardHolderName,
            textInputType: TextInputType.text),
        CustomTextFormFiled(
            hintText: S.of(context).cardNumber,
            textInputType: TextInputType.number),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: CustomTextFormFiled(
                  hintText: S.of(context).expiryDate,
                  textInputType: TextInputType.number),
            ),
            Expanded(
              child: CustomTextFormFiled(
                  hintText: S.of(context).cvv,
                  textInputType: TextInputType.number),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            CustomCheckbox(
              isChecked: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val!;
                });
              },
            ),
            Text(
              S.of(context).makeCardDefault,
              textAlign: TextAlign.right,
              style: TextStyles.semiBold13
                  .copyWith(color: const Color(0xff949D9E)),
            ),
          ],
        )
      ],
    );
  }
}
