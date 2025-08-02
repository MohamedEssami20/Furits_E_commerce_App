import 'package:fruits_hub/features/checkout/domain/entities/order_address_details_entity.dart';
import '../../../home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartItems;
   bool? payWithCash;
  final OrderAddressDetailsEntity? orderAddressDetails;

  OrderEntity({
    required this.cartItems,
    this.payWithCash,
    this.orderAddressDetails,
  });
}
