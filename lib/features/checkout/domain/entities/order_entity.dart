import 'package:fruits_hub/features/checkout/domain/entities/order_address_details_entity.dart';
import '../../../home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String userId;
  final CartEntity cartItems;
  bool? payWithCash;
  OrderAddressDetailsEntity orderAddressDetails = OrderAddressDetailsEntity();

  OrderEntity({
    required this.cartItems,
    this.payWithCash,
    required this.orderAddressDetails,
    required this.userId,
  });

  // create method that get address details;

  String getAddressDetails() {
    return '${orderAddressDetails.city}, ${orderAddressDetails.address}, ${orderAddressDetails.floorName}';
  }

  String getPaymentMethod() {
    return payWithCash == true ? 'نقدا' : 'بطاقة بانكية';
  }

  double claculateShippingCost() {
    if (payWithCash == true) {
      return 30;
    } else {
      return 0;
    }
  }

  double getShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterShipping() {
    return cartItems.calculateTotalPrice() +
        claculateShippingCost() -
        getShippingDiscount();
  }

}
