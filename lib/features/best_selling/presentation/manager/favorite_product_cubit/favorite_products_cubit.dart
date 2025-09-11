import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit({
    required this.productRepos,
  }) : super(FavoriteProductsInitial());

  final ProductRepos productRepos;
  // create methodt to add product to favorite
  Future<void> addToFavorite({required String productId}) async {
    emit(AddFavoriteProductsLoading());
    final result = await productRepos.addToFavorites(productId: productId);
    result.fold(
      (l) => emit(
        AddFavoriteProductsFailure(errormessage: l.errorMessage),
      ),
      (r) => emit(
        const AddFavoriteProductsSuccess(),
      ),
    );
  }
}
