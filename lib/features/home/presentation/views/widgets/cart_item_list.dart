import 'package:flutter/material.dart';

import '../../../../../core/utils/Widgets/custom_divider.dart';
import 'cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: CartItem(),
      ),
      itemCount: 15,
    );
  }
}
