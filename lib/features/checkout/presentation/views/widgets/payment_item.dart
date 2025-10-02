import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.title,
    required this.child,
    required this.showTitle,
  });
  final String title;
  final Widget child;
  final bool showTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Visibility(
          visible: showTitle,
          child: Text(
            title,
            style: TextStyles.bold13.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        ),
      ],
    );
  }
}
