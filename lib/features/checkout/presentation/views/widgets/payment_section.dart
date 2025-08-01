import 'package:flutter/material.dart';
import 'order_address_details.dart';
import 'order_summary.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 24,
        ),
        OrderSummary(),
        SizedBox(
          height: 16,
        ),
        OrderAddressDetails(),
      ],
    );
  }
}
