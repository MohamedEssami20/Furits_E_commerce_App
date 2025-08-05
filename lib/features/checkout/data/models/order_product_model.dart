
import '../../../home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.quantity});

  factory OrderProductModel.formEntity(CartItemEntity entity) =>
      OrderProductModel(
        name: entity.productEntity.name,
        imageUrl: entity.productEntity.iamgeUrl!,
        price: entity.productEntity.price.toDouble(),
        quantity: entity.quantity,
      );

  toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "price": price,
        "quantity": quantity
      };
}
