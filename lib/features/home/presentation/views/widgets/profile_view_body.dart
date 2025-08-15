import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        children: [
          buildAppBar(
            context,
            title: "حسابي",
            showBackButton: false,
            showNotification: false,
          ),
        ],
      ),
    );
  }
}
