import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

// create method that update ui when increase or decrease quantity
  void updateQuantity(CartItemEntity cartItem) {
    emit(CartItemUptated(cartItemsEntity: cartItem));
  }
}
