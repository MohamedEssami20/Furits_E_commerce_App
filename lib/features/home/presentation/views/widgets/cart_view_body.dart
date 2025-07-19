import 'package:flutter/material.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(
                    title: "المنتجات",
                    context,
                    showBackButton: true,
                    showNotification: false),
                const SizedBox(
                  height: 20,
                ),
                const CartViewHeader(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
