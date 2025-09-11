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

final class AddFavoriteProductsLoading extends FavoriteProductsState {}
