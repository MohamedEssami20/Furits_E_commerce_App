import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemsEntity;

  CartEntity({required this.cartItemsEntity});

  void addCartItem(CartItemEntity cartItemEntity) {
    cartItemsEntity.add(cartItemEntity);
  }

  // remove cart item;
  void removeCartItem(CartItemEntity cartItemEntity) {
    cartItemsEntity.remove(cartItemEntity);
  }

  // create method that claculate total price of all cart items;
  num calculateTotalPrice() => cartItemsEntity.fold(
      0,
      (previousValue, element) =>
          previousValue + element.calculateTotalPrice());

  bool isProductExists(ProductEntity productEntity) {
    for (var product in cartItemsEntity) {
      if (product.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (var product in cartItemsEntity) {
      if (product.productEntity == productEntity) {
        return product;
      }
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }
}
