import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/get_user_data.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import '../../../../../core/utils/Widgets/notification_widget.dart';
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
      subtitle: Text(getUserData().userName, style: TextStyles.bold16),
      trailing: const NotificationWidget(),
    );
  }
}
