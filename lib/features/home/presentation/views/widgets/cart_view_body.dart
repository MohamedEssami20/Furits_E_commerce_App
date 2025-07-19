import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_divider.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_list.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
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
                  const SizedBox(
                    height: 23,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            const CartItemList(),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * 0.07,
          child: CustomButton(onPressed: () {}, title: "الدفع 120جنيه"),
        )
      ],
    );
  }
}
