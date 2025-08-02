import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_decoration.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Text(
          title,
          style: TextStyles.bold13.copyWith(
            color: const Color(0xFF0C0D0D),
          ),
        ),
        Container(
          decoration: AppDecoration.greyBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
