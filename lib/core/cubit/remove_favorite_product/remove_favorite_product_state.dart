part of 'remove_favorite_product_cubit.dart';

sealed class RemoveFavoriteProductState extends Equatable {
  const RemoveFavoriteProductState();

  @override
  List<Object> get props => [];
}

final class RemoveFavoriteProductInitial extends RemoveFavoriteProductState {}

// create all state of remove favorite product;

final class RemoveFavoriteProductLoading extends RemoveFavoriteProductState {}

final class RemoveFavoriteProductError extends RemoveFavoriteProductState {
  final String errorMessage;
  const RemoveFavoriteProductError({required this.errorMessage});
}

final class RemoveFavoriteProductSuccess extends RemoveFavoriteProductState {}
