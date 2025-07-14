import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

import '../app_text_style.dart';
import 'custom_network_image.dart';

class FruitsItem extends StatelessWidget {
  const FruitsItem({
    super.key,
    required this.product,
  });
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 220,
      color: const Color(0xfff3f5f7),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: product.iamgeUrl != null
                      ? CustomNetowrkImage(
                          imageUrl: product.iamgeUrl!,
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                        ),
                ),
                ListTile(
                  title: Text(
                    product.name,
                    style: TextStyles.semiBold16,
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${product.price} جنيه",
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
          Positioned(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
