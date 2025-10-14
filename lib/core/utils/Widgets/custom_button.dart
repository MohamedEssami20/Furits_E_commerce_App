import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onPressed, this.child, this.title});
  final VoidCallback onPressed;
  final String? title;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
        child: child ??
            Text(
              title!,
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
      ),
    );
  }
}
