import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';


class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "تمتلك حساب بالفعل ؟",
            style: TextStyles.bold16.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pop();
              },
            text: "تسجيل الدخول",
            style: TextStyles.bold16.copyWith(color: MyColors.kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
