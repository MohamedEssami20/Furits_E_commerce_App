
import 'package:fruits_hub/core/helper/get_payment_currency.dart';

import '../../../../../home/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  factory ItemEntity.fromEntity(CartItemEntity cartItem) => ItemEntity(
        name: cartItem.productEntity.name,
        quantity: cartItem.quantity,
        price: cartItem.productEntity.price.toString(),
        currency: getCurrency(),
      );
}
