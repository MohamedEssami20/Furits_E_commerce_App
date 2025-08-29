import 'package:fruits_hub/features/checkout/data/models/order_address_details_model.dart';
import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String userId;
  final String totalPrice;
  final OrderAddressDetailsModel orderAddressDetailsModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;
  final String orderId;

  OrderModel(
      {required this.userId,
      required this.totalPrice,
      required this.orderAddressDetailsModel,
      required this.orderProductModel,
      required this.paymentMethod,
      required this.orderId});

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
        orderId: generateOrderId(),
      );

  // create from json method;
  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        userId: json['userId'],
        totalPrice: json['totalPrice'],
        orderAddressDetailsModel: OrderAddressDetailsModel.fromJson(
            json['orderAddressDetailsModel']),
        orderProductModel: json['orderProductModel']
            .map((e) => OrderProductModel.fromJson(e))
            .toList(),
        paymentMethod: json['paymentMethod'],
        orderId: json['orderId'],
      );

  // create to json method
  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'userId': userId,
        'status': "pending",
        'date': DateTime.now().toString(),
        'totalPrice': totalPrice,
        'orderAddressDetailsModel': orderAddressDetailsModel.toJson(),
        'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };
  

  // create entity method from MyOrdersEntity
  MyOrdersEntity toEntity() => MyOrdersEntity(
        userId: userId,
        totalPrice: totalPrice,
        myOrdersAddressDetailsEntity: orderAddressDetailsModel.toEntityTwo(),
        orderProductEntity: orderProductModel.map((e) => e.toEntityTwo()).toList(),
        paymentMethod: paymentMethod,
        orderId: orderId,
      );
}

// creat merthod that generate code of order
String generateOrderId() => const Uuid().v4();
