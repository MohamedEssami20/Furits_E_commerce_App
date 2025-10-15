import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/l10n.dart';
import 'rating_bar_item.dart';

class SummaryOfRating extends StatelessWidget {
  const SummaryOfRating({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).summary,
              style: TextStyles.semiBold16.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
        Row(
          spacing: 12,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    spacing: 4,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFB400),
                        size: 20,
                      ),
                      Text(
                        productEntity.avgRating.toString(),
                        style: TextStyles.bold13.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '88%',
                    style: TextStyles.regular13.copyWith(
                      height: 1.40,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    S.of(context).suggested,
                    style: TextStyles.regular13.copyWith(
                      height: 1.40,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 4,
              child: RatingSummary(),
            ),
          ],
        ),
      ],
    );
  }
}
