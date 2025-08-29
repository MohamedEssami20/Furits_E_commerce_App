
import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_address_details_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_product_entity.dart';


class MyOrdersEntity {
  final String userId;
  final String totalPrice;
  final MyOrdersAddressDetailsEntity myOrdersAddressDetailsEntity;
  final List<MyOrdersProductEntity> orderProductEntity;
  final String paymentMethod;
  final String orderId;

  MyOrdersEntity(
      {required this.userId,
      required this.totalPrice,
      required this.myOrdersAddressDetailsEntity,
      required this.orderProductEntity,
      required this.paymentMethod,
      required this.orderId,});

  
}
