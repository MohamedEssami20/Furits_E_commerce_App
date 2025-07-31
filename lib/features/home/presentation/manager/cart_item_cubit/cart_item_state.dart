part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();
}

final class CartItemInitial extends CartItemState {}

final class CartItemUptated extends CartItemState {
  final CartItemEntity cartItemsEntity;
  CartItemUptated({required this.cartItemsEntity});
}
