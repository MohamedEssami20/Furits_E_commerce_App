import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best_selling/presentation/views/widgets/add_favorite_products_listener.dart';
import 'package:fruits_hub/features/best_selling/presentation/views/widgets/best_selling_gridview_bloc_builder.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddAndRemoveFavoriteProductsListener(
        child: BestSellingGridViewBlocBuilder());
  }
}
