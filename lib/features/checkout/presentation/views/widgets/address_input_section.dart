import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CustomTextFormFiled(
            hintText: "الاسم كامل",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormFiled(
            hintText: "البريد الإلكتروني",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormFiled(
            hintText: "العنوان",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormFiled(
            hintText: "رقم الجوال",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormFiled(
            hintText: "المدينة",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormFiled(
            hintText: "رقم الطابق , رقم الشقه ..",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
