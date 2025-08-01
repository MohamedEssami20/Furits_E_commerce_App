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
          title: "الدفع عند الاستلام",
          subTitle: "التسليم من المكان",
          price: "40",
        ),
        SizedBox(height: 16),
        ShippingItem(
          title: "اشتري أون لاين",
          subTitle: "التسليم من المكان",
          price: "40",
        ),
      ],
    );
  }
}
