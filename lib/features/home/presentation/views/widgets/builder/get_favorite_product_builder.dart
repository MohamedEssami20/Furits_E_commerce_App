import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/get_dummy_products.dart';
import 'package:fruits_hub/features/home/presentation/manager/get_favorite_products_cubit/get_favorite_product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/favorite_products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetFavoriteProductBuilder extends StatefulWidget {
  const GetFavoriteProductBuilder({super.key});

  @override
  State<GetFavoriteProductBuilder> createState() =>
      _GetFavoriteProductBuilderState();
}

class _GetFavoriteProductBuilderState extends State<GetFavoriteProductBuilder> {
  @override
  void initState() {
    context.read<GetFavoriteProductCubit>().getFavoriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteProductCubit, GetFavoriteProductState>(
      builder: (context, state) {
        if (state is GetFavoriteProductsSuccess) {
          if (state.products.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "لا يوجد منتجات في المفضلة",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          } else {
            return FavoriteProductsGridView(
              products: state.products,
            );
          }
        } else if (state is GetFavoriteProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errormessage,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        }
        return Skeletonizer.sliver(
          enabled: true,
          child: FavoriteProductsGridView(
            products: getDummyProducts(),
          ),
        );
      },
    );
  }
}
