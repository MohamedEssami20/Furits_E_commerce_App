import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntityList = CartEntity(cartItemsEntity: []);

  void addProductToCart(ProductEntity productEntity) {
    bool isProductExists = cartEntityList.isProductExists(productEntity);
    {
      if (isProductExists) {
        // increase count;
      }
      else{
        CartItemEntity cartItemEntity = CartItemEntity(productEntity: productEntity, count: 1);
        cartEntityList.addCartItem(cartItemEntity);
      }
    }
    emit(CartItemAdded());
  }
}
