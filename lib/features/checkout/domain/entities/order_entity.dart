import 'package:fruits_hub/features/checkout/domain/entities/order_address_details_entity.dart';
import '../../../home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartItems;
  bool? payWithCash;
  OrderAddressDetailsEntity orderAddressDetails = OrderAddressDetailsEntity();

  OrderEntity({
    required this.cartItems,
    this.payWithCash,
    required this.orderAddressDetails,
  });

  // create method that get address details;

  String getAddressDetails() {
    return '${orderAddressDetails.city}, ${orderAddressDetails.address}, ${orderAddressDetails.floorName}';
  }
}
