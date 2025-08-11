import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/utils/Widgets/custom_text_form_filed.dart';

class CodeInputField extends StatefulWidget {
  const CodeInputField({super.key});

  @override
  State<CodeInputField> createState() => _CodeInputFieldState();
}

class _CodeInputFieldState extends State<CodeInputField> {
  final _controllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _nextField(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).nextFocus();
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: 75,
            height: 60,
            child: CustomTextFormFiled(
              controller: _controllers[index],
              hintText: '',
              textAlign: TextAlign.center,
              textInputType: TextInputType.number,
              maxLength: 1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                _nextField(value, index);
              },
              onSaved: (value) {
                if (value != null && value.isNotEmpty) {
                  _controllers[index].text = value;
                  log("value= $value");
                } else {
                  _controllers[index].text = '';
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
