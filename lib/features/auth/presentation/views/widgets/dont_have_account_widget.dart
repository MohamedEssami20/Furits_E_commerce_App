import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "لا تمتلك حساب؟ ",
            style: TextStyles.bold16.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
          TextSpan(
            text: "قم بإنشاء حساب",
            style: TextStyles.bold16
                .copyWith(color: MyColors.kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
