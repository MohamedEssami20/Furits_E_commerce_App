import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 12,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
        ),
        Text(
          'الشحن',
          style: TextStyles.bold13.copyWith(
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
