import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PayPalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PayPalPaymentEntity({this.amount, this.description, this.itemList});

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };

  factory PayPalPaymentEntity.fromEntity(OrderEntity order) {
    return PayPalPaymentEntity(
      amount: Amount.fromEntity(order),
      description: order.getPayPalDescription(),
      itemList: ItemList.fromEntity(order.cartItems.cartItemsEntity),
    );
  }
}
