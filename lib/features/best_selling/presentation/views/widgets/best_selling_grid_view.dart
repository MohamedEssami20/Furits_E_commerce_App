import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/Widgets/fruits_item.dart';
import 'package:fruits_hub/features/products_details/presentation/view/products_details_view.dart';

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
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductsDetailsView.routeName,
            arguments: products[index],
          );
        },
        child: FruitsItem(
          product: products[index],
        ),
      ),
      itemCount: products.length,
    );
  }
}
