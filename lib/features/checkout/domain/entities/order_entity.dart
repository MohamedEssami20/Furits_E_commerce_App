import 'package:fruits_hub/features/checkout/domain/entities/order_address_details_entity.dart';
import '../../../home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final OrderAddressDetailsEntity orderAddressDetails;

  OrderEntity(
      {required this.cartItems,
      required this.payWithCash,
      required this.orderAddressDetails});
}
