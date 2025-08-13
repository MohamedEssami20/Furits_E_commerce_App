import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

class CustomVerificationButton extends StatelessWidget {
  const CustomVerificationButton({super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: MyColors.activIndicatorColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        child: title,
      ),
    );
  }
}
