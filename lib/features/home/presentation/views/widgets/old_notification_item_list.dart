import 'package:flutter/material.dart';

import 'notification_item.dart';

class OldNotificationItemList extends StatelessWidget {
  const OldNotificationItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: NotificationItem(
          isNotificationRead: true,
        ),
      ),
      itemCount: 5,
    );
  }
}