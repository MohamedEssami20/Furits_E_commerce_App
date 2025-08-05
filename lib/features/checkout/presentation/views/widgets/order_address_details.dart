import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/assets.dart' show Assets;
import 'payment_item.dart';

class OrderAddressDetails extends StatelessWidget {
  const OrderAddressDetails({super.key, required this.pageController});
  final PageController pageController;
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
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Row(
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
                context.read<OrderEntity>().getAddressDetails(),
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
