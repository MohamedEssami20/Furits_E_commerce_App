import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../manager/details_and_reviews_cubit/detais_and_reviews_cubit.dart';

class ProductsReviewsHeaderAndDescription extends StatelessWidget {
  const ProductsReviewsHeaderAndDescription(
      {super.key, required this.theme, required this.productEntity});
  final ThemeData theme;
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(productEntity.avgRating.toString(),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                )),
            Text(
              "(30+)",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<DetailsAndReviewsCubit>().changeIndex(1);
              },
              child: Text(
                S.of(context).review,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: 13,
                  color: theme.colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        Text(
          productEntity.description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.60,
          ),
        ),
      ],
    );
  }
}
