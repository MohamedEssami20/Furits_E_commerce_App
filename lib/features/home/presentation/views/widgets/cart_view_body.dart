import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_divider.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isProductInCart =
        context.read<CartCubit>().cartEntityList.cartItemsEntity.isNotEmpty;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(
                    title: S.of(context).cart,
                    context,
                    showBackButton: true,
                    showNotification: false,
                  ),
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
            SliverToBoxAdapter(
              child: isProductInCart
                  ? const CustomDivider()
                  : const SizedBox.shrink(),
            ),
            CartItemList(
              cartItems:
                  context.watch<CartCubit>().cartEntityList.cartItemsEntity,
            ),
            SliverToBoxAdapter(
              child: isProductInCart
                  ? const CustomDivider()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * 0.07,
          child: const CustomCartPaymentButton(),
        )
      ],
    );
  }
}
