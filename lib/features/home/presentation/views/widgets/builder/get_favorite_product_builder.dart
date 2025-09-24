import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/get_dummy_products.dart';
import 'package:fruits_hub/features/home/presentation/manager/get_favorite_products_cubit/get_favorite_product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/favorite_products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/helper/localization_helper.dart';
import '../../../../../../generated/l10n.dart';

class GetFavoriteProductBuilder extends StatefulWidget {
  const GetFavoriteProductBuilder({super.key});

  @override
  State<GetFavoriteProductBuilder> createState() =>
      _GetFavoriteProductBuilderState();
}

class _GetFavoriteProductBuilderState extends State<GetFavoriteProductBuilder> {
  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read<GetFavoriteProductCubit>()
        .getFavoriteProducts(genralErrorMessage: S.of(context).errorMessage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteProductCubit, GetFavoriteProductState>(
      builder: (context, state) {
        if (state is GetFavoriteProductsSuccess) {
          if (state.products.isEmpty) {
            return SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      S.of(context).noProductsInFavorite,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return FavoriteProductsGridView(
              products: state.products,
            );
          }
        } else if (state is GetFavoriteProductsFailure) {
          final String errorTranslation =
              LocalizationHelper.getFirebaseErrorMessage(
                  context, state.errormessage);
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                errorTranslation,
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
