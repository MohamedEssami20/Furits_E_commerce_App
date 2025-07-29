import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntityList = CartEntity(cartItemsEntity: []);

  void addProductToCart(ProductEntity productEntity) {
    bool isProductExists = cartEntityList.isProductExists(productEntity);
    {
      var carItem = cartEntityList.getCartItem(productEntity);
      if (isProductExists) {
        carItem.increaseCount();
      } else {
        cartEntityList.addCartItem(carItem);
      }
    }
    emit(CartProductAdded());
  }
}
