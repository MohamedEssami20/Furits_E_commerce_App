import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';

import '../../../../../core/utils/app_text_style.dart';
import 'profile_account_and_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(
            context,
            title: "حسابي",
            showBackButton: false,
            showNotification: false,
          ),
          const SizedBox(
            height: 20,
          ),
          const ProfileAccountAndImage(),
          const SizedBox(
            height: 22,
          ),
          Text(
            'عام',
            style: TextStyles.semiBold13.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
