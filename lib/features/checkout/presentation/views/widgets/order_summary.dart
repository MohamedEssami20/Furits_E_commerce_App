import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:fruits_hub/generated/l10n.dart';


class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return PaymentItem(
      showTitle: true,
      title: "${S.of(context).orderSummary} :",
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${S.of(context).subTotal} :',
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Text(
                  '${context.read<OrderEntity>().cartItems.calculateTotalPrice()} ${S.of(context).egp}',
                  textAlign: TextAlign.right,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: theme.colorScheme.onSurface,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '${S.of(context).delivery} :',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Text('50 ${S.of(context).egp}',
                  textAlign: TextAlign.right,
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: theme.colorScheme.onSurface,
                  )),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 0.60,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                S.of(context).total,
                style: theme.textTheme.headlineLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Text(
                '${context.read<OrderEntity>().cartItems.calculateTotalPrice() + 50} ${S.of(context).egp}',
                textAlign: TextAlign.right,
                style: theme.textTheme.headlineLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
