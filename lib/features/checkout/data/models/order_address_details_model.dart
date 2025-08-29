import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_address_details_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_address_details_entity.dart';

class OrderAddressDetailsModel {
  String? fullName;
  String? email;
  String? address;
  String? phone;
  String? city;
  String? floorName;

  OrderAddressDetailsModel({
    this.fullName,
    this.email,
    this.address,
    this.phone,
    this.city,
    this.floorName,
  });

  factory OrderAddressDetailsModel.fromEntity(
          OrderAddressDetailsEntity entity) =>
      OrderAddressDetailsModel(
        fullName: entity.fullName,
        email: entity.email,
        address: entity.address,
        phone: entity.phone,
        city: entity.city,
        floorName: entity.floorName,
      );

  // create from json method;
  factory OrderAddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderAddressDetailsModel(
        fullName: json["fullName"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        city: json["city"],
        floorName: json["floorName"],
      );

  // create toJson method;
  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "address": address,
      "phone": phone,
      "city": city,
      "floorName": floorName
    };
  }

  // create toEntity method;
  OrderAddressDetailsEntity toEntity() => OrderAddressDetailsEntity(
        fullName: fullName,
        email: email,
        address: address,
        phone: phone,
        city: city,
        floorName: floorName,
      );

  // create toEntiy two method;
  MyOrdersAddressDetailsEntity toEntityTwo() => MyOrdersAddressDetailsEntity(
        fullName: fullName,
        email: email,
        address: address,
        phone: phone,
        city: city,
        floorName: floorName,
      );
}
