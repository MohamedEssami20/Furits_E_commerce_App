import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemsEntity;

  CartEntity({required this.cartItemsEntity});
  

  void addCartItem(CartItemEntity cartItemEntity) {
    cartItemsEntity.add(cartItemEntity);
  }

  bool isProductExists(ProductEntity  productEntity) {
    for( var product in cartItemsEntity) {
      if(product.productEntity==productEntity) {
        return true;
      }
    }
    return false;
  }
}
