import 'package:flutter/material.dart';

import '../../../../../core/utils/Widgets/custom_divider.dart';
import '../../domain/entities/cart_item_entity.dart';
import 'cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: CartItem(
          cartItems: cartItems[index],
        ),
      ),
      itemCount: cartItems.length,
    );
  }
}
