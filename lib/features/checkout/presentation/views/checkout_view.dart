import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

import 'widgets/check_out_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItems});
  static const routeName = 'checkout';
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "الشحن",
        showBackButton: true,
        showNotification: false,
      ),
      body: const CheckOutViewBody(),
    );
  }
}
