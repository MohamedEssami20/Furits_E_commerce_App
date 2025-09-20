import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../manager/cart_cubit/cart_cubit.dart';

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
      child: Center(
        child: Text(
          "${S.of(context).youHave} ${context.watch<CartCubit>().cartEntityList.cartItemsEntity.length} ${S.of(context).productsIntoCart}",
          style: const TextStyle(
            color: Color(0xff1B5E37),
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: "Cairo",
            height: 1.60,
          ),
        ),
      ),
    );
  }
}
