import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/utils/Widgets/fruits_item.dart';
import 'package:fruits_hub/features/best_selling/presentation/manager/favorite_product_cubit/favorite_products_cubit.dart';
import 'package:fruits_hub/features/best_selling/presentation/views/widgets/add_favorite_products_listener.dart';

import '../../../../../core/repos/product_repos.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 163 / 214),
      itemBuilder: (context, index) => BlocProvider(
        create: (context) =>
            FavoriteProductsCubit(productRepos: getIt.get<ProductRepos>()),
        child: AddFavoriteProductsListener(
          child: FruitsItem(
            product: products[index],
          ),
        ),
      ),
      itemCount: products.length,
    );
  }
}
