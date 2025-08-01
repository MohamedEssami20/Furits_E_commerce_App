import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            Navigator.of(context).pushNamed(CheckoutView.routeName);
          },
          title:
              "الدفع ${context.watch<CartCubit>().cartEntityList.calculateTotalPrice()} جنيه",
        );
      },
    );
  }
}
