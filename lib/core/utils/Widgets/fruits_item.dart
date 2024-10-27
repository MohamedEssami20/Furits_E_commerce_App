import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

import '../app_text_style.dart';

class FruitsItem extends StatelessWidget {
  const FruitsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 220,
      color: const Color(0xfff3f5f7),
      child: Stack(
        children: [
          Positioned(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(Assets.assetsImagesWaterMelonTestImage),
                ListTile(
                  title: const Text(
                    "بطيخ",
                    style: TextStyles.semiBold16,
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '50جنيه',
                          style: TextStyles.bold13
                              .copyWith(color: MyColors.kSecondaryColor),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13
                              .copyWith(color: MyColors.kLightSecondaryColor),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyles.semiBold13
                              .copyWith(color: MyColors.kLightSecondaryColor),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyles.semiBold13
                              .copyWith(color: MyColors.kLightSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: MyColors.kPrimaryColor,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
