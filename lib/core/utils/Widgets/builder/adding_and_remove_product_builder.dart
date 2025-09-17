import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/best_selling/presentation/manager/favorite_product_cubit/favorite_products_cubit.dart';

class AddAndRemovingProductBuilder extends StatelessWidget {
  const AddAndRemovingProductBuilder(
      {super.key, required this.widget, required this.productId});
  final Widget widget;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
      builder: (context, state) {
        final currentProductId =
            context.read<FavoriteProductsCubit>().currentProductId;
        final isAdding = state is AddFavoriteProductsLoading &&
            currentProductId == productId;
        final isRemoving = state is RemoveFavoriteProductLoading &&
            currentProductId == productId;
        if (isAdding || isRemoving) {
          return const SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );
        } else {
          return widget;
        }
      },
    );
  }
}
