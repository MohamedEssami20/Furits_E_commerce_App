import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntityList = CartEntity(cartItemsEntity: []);

  void addCartItem(CartItemEntity cartItemEntity) {
    cartEntityList.addCartItem(cartItemEntity);
    emit(CartItemAdded());
  }
}
