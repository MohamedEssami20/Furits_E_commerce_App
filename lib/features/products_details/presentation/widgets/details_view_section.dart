import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

import '../../../../core/utils/Widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'another_details_grid_view.dart';
import 'products_details_appbar.dart';
import 'products_details_title.dart';
import 'products_reviews_header_and_description.dart';

class DetailsViewSection extends StatelessWidget {
  const DetailsViewSection({
    super.key,
    required this.productEntity,
    required this.height,
    required this.theme,
    required this.textDirection,
  });

  final ProductEntity productEntity;
  final double height;
  final ThemeData theme;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductsDetailsAppBar(
          image: productEntity.iamgeUrl!,
          height: height,
          theme: theme,
          textDirection: textDirection,
        ),
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 13,
            ),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductsDetailsTitle(
                  prductName: productEntity.name,
                  prductPrice: productEntity.price.toString(),
                  theme: theme,
                ),
                ProductsReviewsHeaderAndDescription(
                  theme: theme,
                  productEntity: productEntity,
                ),
                Expanded(
                  child: AnotherDetailsGridView(
                    productEntity: productEntity,
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    context.read<CartCubit>().addProductToCart(productEntity);
                  },
                  title: S.of(context).addToCart,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
