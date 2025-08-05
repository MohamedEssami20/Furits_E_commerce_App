import 'package:flutter/material.dart';
import 'order_address_details.dart';
import 'order_summary.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        const OrderSummary(),
        const SizedBox(
          height: 16,
        ),
        OrderAddressDetails(
          pageController: pageController,
        ),
      ],
    );
  }
}
