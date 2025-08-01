import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

import 'active_shipping_item_dot.dart';
import 'in_active_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isActive,
  });
  final String title, subTitle, price;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 350,
      padding: const EdgeInsets.only(
        top: 16,
        left: 13,
        right: 16,
        bottom: 16,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.8,
            color: isActive
                ? AppColors.lightSecondaryColor
                : Colors.transparent /* Grayscale-400 */,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isActive
                ? const ActiveShippingItemDot()
                : const InActiveShippingItemDot(),
            const SizedBox(
              width: 10,
            ),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.semiBold13,
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13.copyWith(
                    color: Colors.black.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                '$price جنيه',
                style: TextStyles.bold13
                    .copyWith(color: AppColors.lightSecondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
