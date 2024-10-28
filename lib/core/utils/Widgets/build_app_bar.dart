  import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/notification_widget.dart';

import '../app_text_style.dart';

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: const [
        Padding(padding: EdgeInsets.only(left: 20),child: NotificationWidget(),),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      centerTitle: true,
      title: const Text("الأكثر مبيعًا", style: TextStyles.bold19,),
    );
  }
