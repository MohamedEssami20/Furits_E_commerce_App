import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/best_selling/presentation/manager/favorite_product_cubit/favorite_products_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/helper/build_error_snackbar.dart';

class AddAndRemoveFavoriteProductsListener extends StatelessWidget {
  const AddAndRemoveFavoriteProductsListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteProductsCubit, FavoriteProductsState>(
      listenWhen: (previous, current) {
        return current is AddFavoriteProductsFailure ||
            current is AddFavoriteProductsSuccess ||
            current is RemoveFavoriteProductSuccess;
      },
      listener: (context, state) {
        if (state is AddFavoriteProductsSuccess) {
          buildErrorSnackBar(context,S.of(context).addProductToFavoriteSuccess);
        }
        if (state is RemoveFavoriteProductSuccess) {
          buildErrorSnackBar(context, S.of(context).removeProductFromFavoriteSuccess);
        }
        if (state is AddFavoriteProductsFailure) {
          buildErrorSnackBar(context, state.errormessage);
        }
      },
      child: child,
    );
  }
}
