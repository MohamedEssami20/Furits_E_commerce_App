import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.onSaved,
  });
  final Function(String?)? onSaved;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: "كلمة المرور",
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off_rounded,
                color: Color(0xffC9CECF),
              )
            : const Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xffC9CECF),
              ),
      ),
    );
  }
}
