import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory DetailsEntity.fromEntity(OrderEntity orderEntity) => DetailsEntity(
        subtotal: orderEntity.cartItems.calculateTotalPrice().toString(),
        shipping: orderEntity.claculateShippingCost().toString(),
        shippingDiscount: orderEntity.getShippingDiscount(),
      );
}
