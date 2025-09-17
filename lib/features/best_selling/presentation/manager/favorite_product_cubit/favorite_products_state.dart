part of 'favorite_products_cubit.dart';

sealed class FavoriteProductsState {
  const FavoriteProductsState();
}

final class FavoriteProductsInitial extends FavoriteProductsState {}

// create all state of add products to favorite
final class AddFavoriteProductsSuccess extends FavoriteProductsState {
  const AddFavoriteProductsSuccess();
}

final class AddFavoriteProductsFailure extends FavoriteProductsState {
  final String errormessage;
  const AddFavoriteProductsFailure({required this.errormessage});
}

final class AddFavoriteProductsLoading extends FavoriteProductsState {
  final String productId;
  const AddFavoriteProductsLoading({required this.productId});
}

final class RemoveFavoriteProductInitial extends FavoriteProductsState {}

// create all state of remove favorite product;

final class RemoveFavoriteProductLoading extends FavoriteProductsState {
  final String productId;
  const RemoveFavoriteProductLoading({required this.productId});
}

final class RemoveFavoriteProductError extends FavoriteProductsState {
  final String errorMessage;
  const RemoveFavoriteProductError({required this.errorMessage});
}

final class RemoveFavoriteProductSuccess extends FavoriteProductsState {}

