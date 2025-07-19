import 'package:flutter/material.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFFEBF9F1),
      ),
      child: const Center(
        child: Text(
          "لديك 3 منتجات في سلة التسوق",
          style: TextStyle(
              color: Color(0xff1B5E37),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: "Cairo",
              height: 1.60),
        ),
      ),
    );
  }
}
