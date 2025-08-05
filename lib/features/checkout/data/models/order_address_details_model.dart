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
}
