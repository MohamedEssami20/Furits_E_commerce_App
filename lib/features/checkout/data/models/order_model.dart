import 'package:fruits_hub/features/checkout/data/models/order_address_details_model.dart';
import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final String userId;
  final String totalPrice;
  final OrderAddressDetailsModel orderAddressDetailsModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;

  OrderModel(
      {required this.userId,
      required this.totalPrice,
      required this.orderAddressDetailsModel,
      required this.orderProductModel,
      required this.paymentMethod});

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
        userId: orderEntity.userId,
        totalPrice: orderEntity.cartItems.calculateTotalPrice().toString(),
        orderAddressDetailsModel: OrderAddressDetailsModel.fromEntity(
          orderEntity.orderAddressDetails,
        ),
        orderProductModel: orderEntity.cartItems.cartItemsEntity
            .map((e) => OrderProductModel.formEntity(e))
            .toList(),
        paymentMethod: orderEntity.payWithCash! ? "cash" : "online",
      );

  // create to json method
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'totalPrice': totalPrice,
        'orderAddressDetailsModel': orderAddressDetailsModel.toJson(),
        'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };
}
