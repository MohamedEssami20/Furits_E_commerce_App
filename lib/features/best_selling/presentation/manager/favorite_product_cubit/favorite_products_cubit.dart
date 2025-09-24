import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';

import '../../../../../core/entities/product_entity.dart';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit({
    required this.productRepos,
  }) : super(FavoriteProductsInitial());

  final ProductRepos productRepos;
  String? currentProductId;

  final Map<String, bool> favoriteProducts = {};

  Map<String, bool> get getFavoriteProducts => favoriteProducts;

  // create method that set favorite products from backend;
  void setFavoriteProducts(List<ProductEntity> products) {
    favoriteProducts.clear();
    for (var element in products) {
      favoriteProducts[element.id] = element.isFavorite;
    }
  }

  // create methodt to add product to favorite
  Future<void> addToFavorite(
      {required String productId, required String genralErrorMessage}) async {
    currentProductId = productId;
    emit(AddFavoriteProductsLoading(productId: productId));
    final result = await productRepos.addToFavorites(
        productId: productId, genralErrorMessage: genralErrorMessage);
    result.fold(
      (l) => emit(
        AddFavoriteProductsFailure(errormessage: l.errorMessage),
      ),
      (r) {
        favoriteProducts[productId] = true;
        emit(
          const AddFavoriteProductsSuccess(),
        );
      },
    );
  }

  // create methodt that remove favorite product;
  Future<void> removeFavoriteProduct(
      {required String productId, required String genralErrorMessage}) async {
    currentProductId = productId;
    emit(RemoveFavoriteProductLoading(productId: productId));
    final result = await productRepos.removeFavoriteProduct(
        productId: productId, genralErrorMessage: genralErrorMessage);
    result.fold(
      (l) => emit(RemoveFavoriteProductError(errorMessage: l.errorMessage)),
      (r) {
        favoriteProducts.remove(productId);
        emit(
          RemoveFavoriteProductSuccess(),
        );
      },
    );
  }

  bool isFavoriteProduct(String productId) =>
      favoriteProducts[productId] ?? false;
}
