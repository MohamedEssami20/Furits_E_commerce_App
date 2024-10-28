import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const ShapeDecoration(
        color: Color(0xffEEF8ED),
        shape: OvalBorder(),
      ),
      child: SvgPicture.asset(Assets.assetsImagesNotificationIcon),
    );
  }
}