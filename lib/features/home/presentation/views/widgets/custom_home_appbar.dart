import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';

import '../../../../../core/utils/app_text_style.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        "صباح الخير !..",
        style: TextStyles.regular16.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      subtitle: const Text("أحمد مصطفي", style: TextStyles.bold16),
      trailing: Container(
        padding: const EdgeInsets.all(14),
        decoration: const ShapeDecoration(
          color: Color(0xffEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.assetsImagesNotificationIcon),
      ),
    );
  }
}
