import 'package:fruits_hub/features/checkout/data/models/order_address_details_model.dart';
import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String userId;
  final String orderDate;
  final String totalPrice;
  final OrderAddressDetailsModel orderAddressDetailsModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;
  final String orderId;
  final Map<String, dynamic> orderStatus;

  OrderModel(
      {required this.userId,
      required this.orderStatus,
      required this.orderDate,
      required this.totalPrice,
      required this.orderAddressDetailsModel,
      required this.orderProductModel,
      required this.paymentMethod,
      required this.orderId});

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
        userId: orderEntity.userId,
        totalPrice: orderEntity.cartItems.calculateTotalPrice().toString(),
        orderDate: DateTime.now().toString(),
        orderAddressDetailsModel: OrderAddressDetailsModel.fromEntity(
          orderEntity.orderAddressDetails,
        ),
        orderProductModel: orderEntity.cartItems.cartItemsEntity
            .map((e) => OrderProductModel.formEntity(e))
            .toList(),
        paymentMethod: orderEntity.payWithCash! ? "cash" : "online",
        orderId: generateOrderId(),
        orderStatus: sendOrderStatus(),
      );

  // create from json method;
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final rawStatus = Map<String, dynamic>.from(json['status'] ?? {});

    final orderedStatus = {
      'trackingOrder': rawStatus['trackingOrder'] ?? "قيد الإنتظار",
      'acceptedOrder': rawStatus['acceptedOrder'] ?? "قيد الإنتظار",
      'orderShipped': rawStatus['orderShipped'] ?? "قيد الإنتظار",
      'orderOnWay': rawStatus['orderOnWay'] ?? "قيد الإنتظار",
      'orderReceived': rawStatus['orderReceived'] ?? "قيد الإنتظار",
    };
    return OrderModel(
      userId: json['userId'],
      orderDate: json['date'],
      totalPrice: json['totalPrice'],
      orderAddressDetailsModel:
          OrderAddressDetailsModel.fromJson(json['orderAddressDetailsModel']),
      orderProductModel: List<OrderProductModel>.from(
        json['orderProductModel'].map(
          (e) => OrderProductModel.fromJson(e),
        ),
      ),
      paymentMethod: json['paymentMethod'],
      orderId: json['orderId'],
      orderStatus: orderedStatus,
    );
  }

  // create to json method
  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'userId': userId,
        'status': orderStatus,
        'date': getDateTimeNow(),
        'totalPrice': totalPrice,
        'orderAddressDetailsModel': orderAddressDetailsModel.toJson(),
        'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };

  // create entity method from MyOrdersEntity
  MyOrdersEntity toEntity() => MyOrdersEntity(
        userId: userId,
        orderDate: orderDate,
        status: orderStatus,
        totalPrice: totalPrice,
        myOrdersAddressDetailsEntity: orderAddressDetailsModel.toEntityTwo(),
        orderProductEntity:
            orderProductModel.map((e) => e.toEntityTwo()).toList(),
        paymentMethod: paymentMethod,
        orderId: orderId,
      );
}

// creat merthod that generate code of order
String generateOrderId() => const Uuid().v4();
Map<String, String> sendOrderStatus() {
  return {
    'trackingOrder': getDateTimeNow(),
    'acceptedOrder': "قيد الإنتظار",
    'orderShipped': "قيد الإنتظار",
    'orderOnWay': "قيد الإنتظار",
    'orderReceived': "قيد الإنتظار",
  };
}

String getDateTimeNow() {
  Intl.defaultLocale = 'ar';
  DateTime now = DateTime.now();
  return DateFormat.yMMMd().format(now).toString();
}
