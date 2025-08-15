
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_text_form_filed.dart';

class CreateNewPasswordViewBody extends StatefulWidget {
  const CreateNewPasswordViewBody({super.key});

  @override
  State<CreateNewPasswordViewBody> createState() =>
      _CreateNewPasswordViewBodyState();
}

class _CreateNewPasswordViewBodyState extends State<CreateNewPasswordViewBody> {
  bool obscureTextOne = true;
  bool obscureTextTwo = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomTextFormFiled(
            hintText: "كلمة المرور",
            textInputType: TextInputType.visiblePassword,
            obscureText: obscureTextOne,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureTextOne = !obscureTextOne;
                });
              },
              child: obscureTextOne
                  ? const Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.visibility_rounded,
                      color: Colors.grey,
                    ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormFiled(
            obscureText: obscureTextTwo,
            hintText: "تاكيد كلمة المرور",
            textInputType: TextInputType.visiblePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureTextTwo = !obscureTextTwo;
                });
              },
              child: obscureTextTwo
                  ? const Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.visibility_rounded,
                      color: Colors.grey,
                    ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            onPressed: () {
            },
            title: "إنشاء كلمة مرور جديدة",
          ),
        ],
      ),
    );
  }
}
