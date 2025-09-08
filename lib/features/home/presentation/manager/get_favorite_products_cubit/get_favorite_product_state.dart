part of 'get_favorite_product_cubit.dart';

sealed class GetFavoriteProductState extends Equatable {
  const GetFavoriteProductState();

  @override
  List<Object> get props => [];
}

final class GetFavoriteProductInitial extends GetFavoriteProductState {}

// create all state of get favorite products
final class GetFavoriteProductsSuccess extends GetFavoriteProductState {
  final List<ProductEntity> products;
  @override
  List<Object> get props => [products];
  const GetFavoriteProductsSuccess({required this.products});
}

final class GetFavoriteProductsFailure extends GetFavoriteProductState {
  final String errormessage;
  @override
  List<Object> get props => [errormessage];
  const GetFavoriteProductsFailure({required this.errormessage});
}

final class GetFavoriteProductsLoading extends GetFavoriteProductState {}


