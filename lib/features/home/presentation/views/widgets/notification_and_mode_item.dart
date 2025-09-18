import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';

import '../../../../../core/utils/app_text_style.dart';

class NotificationAndModeItem extends StatelessWidget {
  const NotificationAndModeItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onToggle, required this.value});
  final String icon, title;
  final ValueChanged<bool> onToggle;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Row(
        spacing: 6,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
          ),
          Text(
            title,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(
                0xFF949D9E,
              ),
            ),
          ),
          const Spacer(),
          FlutterSwitch(
            width: 42,
            height: 22,
            activeSwitchBorder:
                Border.all(width: 0.0, color: Colors.transparent),
            activeToggleBorder: Border.all(width: 6.0, color: Colors.white),
            activeColor: AppColors.lightSecondaryColor,
            //activeToggleColor: Colors.red,
            inactiveSwitchBorder:
                Border.all(width: 0.0, color: Colors.transparent),
            inactiveColor: const Color(0xFFC2C5CE),
            toggleSize: 20,
            toggleColor: Colors.white,
            padding: 1,
            value: value,
            borderRadius: 25.0,
            onToggle: onToggle,
          ),
        ],
      ),
    );
  }
}
