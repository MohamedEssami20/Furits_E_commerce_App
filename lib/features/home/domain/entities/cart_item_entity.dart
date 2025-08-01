import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

 // ignore: must_be_immutable
 class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

   CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice() => productEntity.price * count;

  num calculateTotalWeight() => productEntity.unitAmount * count;

  increaseCount() => count++;

  decreaseCount() => count--;
  
  @override
  List<Object?> get props =>[productEntity,count];
}
