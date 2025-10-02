import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/best_selling/presentation/manager/favorite_product_cubit/favorite_products_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import '../app_text_style.dart';
import 'builder/adding_and_remove_product_builder.dart';
import 'custom_network_image.dart';

class FruitsItem extends StatelessWidget {
  const FruitsItem({
    super.key,
    required this.product,
  });
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.watch<FavoriteProductsCubit>();
    var isFavorite = favoriteCubit.isFavoriteProduct(product.id);
    return Container(
      width: 200,
      height: 220,
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: product.iamgeUrl != null
                      ? CustomNetowrkImage(
                          imageUrl: product.iamgeUrl!,
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                        ),
                ),
                ListTile(
                  title: Text(
                    product.name,
                    style: TextStyles.semiBold16.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${product.price} ${S.of(context).egp}",
                          style: TextStyles.bold13.copyWith(
                            color: Theme.of(context).colorScheme.primaryFixed,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13.copyWith(
                            color: Theme.of(context).colorScheme.primaryFixed,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                          style: TextStyles.semiBold13,
                        ),
                        TextSpan(
                          text: S.of(context).kg,
                          style: TextStyles.semiBold13.copyWith(
                            color: Theme.of(context).colorScheme.tertiaryFixed,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      // CartCubit.get(context).addToCart(product);
                      context.read<CartCubit>().addProductToCart(product);
                    },
                    child: CircleAvatar(
                      backgroundColor: MyColors.kPrimaryColor,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: AddAndRemovingProductBuilder(
              productId: product.id,
              widget: IconButton(
                onPressed: () {
                  if (isFavorite == false) {
                    context.read<FavoriteProductsCubit>().addToFavorite(
                        productId: product.id,
                        genralErrorMessage: S.of(context).errorMessage);
                  } else if (isFavorite == true) {
                    context.read<FavoriteProductsCubit>().removeFavoriteProduct(
                        productId: product.id,
                        genralErrorMessage: S.of(context).errorMessage);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? const Color(0xffEB5757) : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
