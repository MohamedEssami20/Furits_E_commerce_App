import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon, this.onSaved});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:(value){
        if(value!.isEmpty || value.isEmpty){
          return "هذا الحقل مطلوب";
        }
        return null;
      } ,
      onSaved: onSaved,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xff949E9D),
        ),
        suffixIcon: suffixIcon,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
        filled: true,
        fillColor: const Color(0xfff9FAFA),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffe6e9e9),
      ),
    );
  }
}
