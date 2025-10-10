import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'another_details_grid_view.dart';
import 'products_details_appbar.dart';
import 'products_details_title.dart';
import 'products_reviews_header_and_description.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final textDirection = Directionality.of(context);
    final theme = Theme.of(context);
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
                  child: AnotherDetailsGridView(productEntity: productEntity,),
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

