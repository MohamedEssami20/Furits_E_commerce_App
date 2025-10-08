import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/assets.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, this.isNotificationRead = false});
  final bool isNotificationRead;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 8),
      color: isNotificationRead == true
          ? const Color(0x7FEBF9F1)
          : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 13,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(Assets.assetsImagesDiscountImage4,
                fit: BoxFit.fill),
          ),
          Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'خصم',
                      style: TextStyles.semiBold13.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyles.semiBold16.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextSpan(
                      text: '50%',
                      style: theme.textTheme.headlineMedium!.copyWith(
                        color: theme.colorScheme.surfaceDim,
                      ),
                    ),
                    TextSpan(
                      text: ' علي اسعار الفواكه بمناسبه العيد',
                      style: TextStyles.semiBold13.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Text(
            '9 صباحا',
            textAlign: TextAlign.right,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
