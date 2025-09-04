import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_checkbox.dart';

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
        const CustomTextFormFiled(
            hintText: "اسم حامل البطاقة", textInputType: TextInputType.text),
        const CustomTextFormFiled(
            hintText: " رقم البطاقة", textInputType: TextInputType.number),
        const Row(
          spacing: 12,
          children: [
            Expanded(
              child: CustomTextFormFiled(
                  hintText: "تاريخ الصلاحية",
                  textInputType: TextInputType.number),
            ),
            Expanded(
              child: CustomTextFormFiled(
                  hintText: "CVV", textInputType: TextInputType.number),
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
              'جعل البطاقة افتراضية',
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
