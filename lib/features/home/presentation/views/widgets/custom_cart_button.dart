import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/utils/Widgets/custom_button.dart';
import '../../../../checkout/presentation/views/checkout_view.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import '../../manager/cart_item_cubit/cart_item_cubit.dart';

class CustomCartPaymentButton extends StatelessWidget {
  const CustomCartPaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            final bool isProductInCart = context
                .read<CartCubit>()
                .cartEntityList
                .cartItemsEntity
                .isNotEmpty;
            if (isProductInCart) {
              Navigator.pushNamed(
                context,
                CheckoutView.routeName,
                arguments: context.read<CartCubit>().cartEntityList,
              );
            } else {
              buildErrorSnackBar(context, S.of(context).noProductIntoCart);
            }
          },
          title:
              "${S.of(context).pay} ${context.watch<CartCubit>().cartEntityList.calculateTotalPrice()} ${S.of(context).egp}",
        );
      },
    );
  }
}
