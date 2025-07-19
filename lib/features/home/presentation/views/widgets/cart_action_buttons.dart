import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';

import '../../../../../core/utils/app_text_style.dart' show TextStyles;

class CartActionButtons extends StatelessWidget {
  const CartActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        const CartActionButton(
          icon: Icons.add,
          iconColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
        ),
        Text(
          '3',
          textAlign: TextAlign.center,
          style: TextStyles.bold13.copyWith(color: Colors.black),
        ),
        const CartActionButton(
          icon: Icons.remove,
          iconColor: Colors.grey,
          backgroundColor: Color(0xFFF1F1F5),
        ),
      ],
    );
  }
}

class CartActionButton extends StatelessWidget {
  const CartActionButton(
      {super.key,
      required this.iconColor,
      required this.backgroundColor,
      required this.icon});
  final Color iconColor, backgroundColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(3),
      decoration: ShapeDecoration(
        color: backgroundColor,
        /* Green1-500 */
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: FittedBox(
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
