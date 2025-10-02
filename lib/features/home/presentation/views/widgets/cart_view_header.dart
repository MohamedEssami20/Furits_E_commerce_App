import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../manager/cart_cubit/cart_cubit.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.onTertiaryFixed,
      ),
      child: Center(
        child: Text(
            "${S.of(context).youHave} ${context.watch<CartCubit>().cartEntityList.cartItemsEntity.length} ${S.of(context).productsIntoCart}",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurface,
            )),
      ),
    );
  }
}
