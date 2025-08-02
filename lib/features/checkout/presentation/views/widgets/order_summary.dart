import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_text_style.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: "ملخص الطلب :",
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '150 جنيه',
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
                'التوصيل :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '50 جنيه',
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
                ' الكلي',
                style: TextStyles.bold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              const Spacer(),
              Text(
                '200 جنيه',
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