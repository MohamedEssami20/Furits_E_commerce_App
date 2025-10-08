import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class NotificationHeaderItem extends StatelessWidget {
  const NotificationHeaderItem({
    super.key,
    required this.theme, required this.title,
  });

  final ThemeData theme;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.headlineLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: 22,
          height: 22,
          decoration: const ShapeDecoration(
            color: Color(0xFFEBF9F1) /* Green1-50 */,
            shape: OvalBorder(),
          ),
          child: Center(
            child: Text(
              "1",
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: 13,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 16),
          child: Text(
            S.of(context).markAllAsRead,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}