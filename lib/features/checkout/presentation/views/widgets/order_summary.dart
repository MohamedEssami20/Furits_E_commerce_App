import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/utils/app_text_style.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      showTitle: true,
      title: "${S.of(context).orderSummary} :",
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${S.of(context).subTotal} :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '${context.read<OrderEntity>().cartItems.calculateTotalPrice()} ${S.of(context).egp}',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '${S.of(context).delivery} :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '50 ${S.of(context).egp}',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
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
                style: TextStyles.bold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              const Spacer(),
              Text(
                '${context.read<OrderEntity>().cartItems.calculateTotalPrice() + 50} ${S.of(context).egp}',
                textAlign: TextAlign.right,
                style: TextStyles.bold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
