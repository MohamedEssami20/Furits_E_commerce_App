import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemsEntity;

  CartEntity({required this.cartItemsEntity});
  

  void addCartItem(CartItemEntity cartItemEntity) {
    cartItemsEntity.add(cartItemEntity);
  }
}
