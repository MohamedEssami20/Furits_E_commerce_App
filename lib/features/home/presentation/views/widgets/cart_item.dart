import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_network_image.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F5F7),
            ),
            child: const CustomNetowrkImage(
              imageUrl: "https://placehold.co/53x40",
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'بطيخ',
                      style: TextStyles.bold13.copyWith(
                        color: const Color(0xff0C0D0D),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        Assets.assetsImagesTrash,
                      ),
                    ),
                  ],
                ),
                Text(
                  '3 كم',
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Row(
                  children: [
                    const CartActionButtons(),
                    const Spacer(),
                    Text(
                      "60 جنيه",
                      style: TextStyles.bold16
                          .copyWith(color: const Color(0xFFF4A91F)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
