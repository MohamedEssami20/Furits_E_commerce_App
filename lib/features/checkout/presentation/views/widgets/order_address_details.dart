import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/assets.dart' show Assets;
import 'payment_item.dart';

class OrderAddressDetails extends StatelessWidget {
  const OrderAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      showTitle: false,
      title: "",
      child: Column(
        spacing: 8,
        children: [
          Row(
            children: [
              Text(
                'عنوان التوصيل',
                style: TextStyles.bold13.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              const Spacer(),
              Row(
                spacing: 5,
                children: [
                  SvgPicture.asset(Assets.assetsImagesEditIcon),
                  Text(
                    'تعديل',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesLocationIcon),
              const SizedBox(
                width: 5,
              ),
              Text(
                'شارع النيل، مبنى رقم ١٢٣',
                textAlign: TextAlign.right,
                style: TextStyles.regular16.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
