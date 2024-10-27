import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

import '../../../../../core/utils/app_text_style.dart';

class FeaturedButtonItem extends StatelessWidget {
  const FeaturedButtonItem({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
          child: Text(
            "تسوق الان",
            style: TextStyles.bold13.copyWith(color: MyColors.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
