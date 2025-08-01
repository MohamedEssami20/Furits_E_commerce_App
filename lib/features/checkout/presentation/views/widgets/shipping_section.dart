import 'package:flutter/material.dart';

import 'shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 32),
        ShippingItem(
          isActive: false,
          title: "الدفع عند الاستلام",
          subTitle: "التسليم من المكان",
          price: "40",
        ),
        SizedBox(height: 16),
        ShippingItem(
          isActive: true,
          title: "اشتري أون لاين",
          subTitle: "التسليم من المكان",
          price: "40",
        ),
      ],
    );
  }
}
