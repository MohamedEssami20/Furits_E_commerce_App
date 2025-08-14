import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/utils/Widgets/custom_text_form_filed.dart';

class CodeInputField extends StatelessWidget {
  const CodeInputField(
      {super.key,
      required this.formKey,
      required this.controllers, required this.autoValidateMode});
  final List<GlobalKey<FormState>> formKey;
  final List<TextEditingController> controllers;
  final List<AutovalidateMode> autoValidateMode;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 75,
              height: 60,
              child: Form(
                autovalidateMode: autoValidateMode[index],
                key: formKey[index],
                child: CustomTextFormFiled(
                  controller: controllers[index],
                  hintText: '',
                  textAlign: TextAlign.center,
                  textInputType: TextInputType.number,
                  maxLength: 1,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 3) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
