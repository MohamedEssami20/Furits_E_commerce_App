import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

import 'profile_picture.dart';

class ProfileAccountAndImage extends StatelessWidget {
  const ProfileAccountAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 25,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ProfilePicture(),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أحمد ياسر',
              style: TextStyles.bold13.copyWith(
                color: const Color(0xFF131F46),
              ),
            ),
            Text(
              'mail@mail.com',
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF888FA0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
