import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/notification_widget.dart';

AppBar buildAppBar(BuildContext context,
    {required String title,
    required bool showBackButton,
    required bool showNotification,
    VoidCallback? onBackPress}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    actions: [
      Visibility(
        visible: showNotification,
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: NotificationWidget(),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: IconButton(
        onPressed: onBackPress ?? () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: Theme.of(context).textTheme.displaySmall,
    ),
  );
}
