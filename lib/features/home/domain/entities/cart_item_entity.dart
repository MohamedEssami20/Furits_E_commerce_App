import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() => productEntity.price * quantity;

  num calculateTotalWeight() => productEntity.unitAmount * quantity;

  increaseQuantity() => quantity++;

  decreasequantity() => quantity--;

  @override
  List<Object?> get props => [productEntity, quantity];
}
