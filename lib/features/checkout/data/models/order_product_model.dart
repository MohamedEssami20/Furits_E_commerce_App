import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_product_entity.dart';

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

  // create form json;
  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
        price: json["price"],
        quantity: json["quantity"],
      );
  toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "price": price,
        "quantity": quantity
      };
  // create to entity;

  MyOrdersProductEntity toEntityTwo() => MyOrdersProductEntity(
        name: name,
        imageUrl: imageUrl,
        price: price,
        quantity: quantity,
  );
}
