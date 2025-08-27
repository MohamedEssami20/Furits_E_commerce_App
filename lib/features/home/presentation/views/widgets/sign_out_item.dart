import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';

import '../../../../../core/utils/app_text_style.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      color: const Color(0xFFEBF9F1),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "تسجيل الخروج",
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF1B5E37),
              ),
            ),
            GestureDetector(
              onTap: () async {
                // await FirebaseAuth.instance.signOut();
                // Navigator.of(context).pushNamed(LoginView.routeName);
              },
              child: SvgPicture.asset(
                Assets.assetsImagesExitIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
