import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

import 'shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        const SizedBox(height: 32),
        ShippingItem(
          onTap: () {
            orderEntity.payWithCash = true;
            setState(() => selectedIndex = 0);
          },
          isActive: selectedIndex == 0,
          title: "الدفع عند الاستلام",
          subTitle: "التسليم من المكان",
          price: "${orderEntity.cartItems.calculateTotalPrice() + 30}",
        ),
        const SizedBox(height: 16),
        ShippingItem(
          onTap: () {
            orderEntity.payWithCash = false;
            setState(() => selectedIndex = 1);
          },
          isActive: selectedIndex == 1,
          title: "اشتري أون لاين",
          subTitle: "التسليم من المكان",
          price: "${orderEntity.cartItems.calculateTotalPrice()}",
        ),
      ],
    );
  }
}
