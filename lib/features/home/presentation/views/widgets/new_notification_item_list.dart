import 'package:flutter/material.dart';

import 'notification_item.dart';

class NewNotificationItemList extends StatelessWidget {
  const NewNotificationItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: NotificationItem(
          isNotificationRead: index % 2 == 0 ? true : false,
        ),
      ),
      itemCount: 5,
    );
  }
}
