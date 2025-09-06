part of 'favorite_products_cubit.dart';

sealed class FavoriteProductsState{
  const FavoriteProductsState();
}

final class FavoriteProductsInitial extends FavoriteProductsState {}

// create all state of add products to favorite
final class FavoriteProductsSuccess extends FavoriteProductsState {
  const FavoriteProductsSuccess();
}

final class FavoriteProductsFailure extends FavoriteProductsState {
  final String errormessage;
  const FavoriteProductsFailure({required this.errormessage});
}

final class FavoriteProductsLoading extends FavoriteProductsState {}
