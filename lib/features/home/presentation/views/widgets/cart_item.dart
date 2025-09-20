import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_network_image.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_action_buttons.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../manager/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItems});
  final CartItemEntity cartItems;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUptated) {
          if (current.cartItemsEntity == cartItems) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F5F7),
                ),
                child: CustomNetowrkImage(
                  imageUrl: cartItems.productEntity.iamgeUrl!,
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
                          cartItems.productEntity.name,
                          style: TextStyles.bold13.copyWith(
                            color: const Color(0xff0C0D0D),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .removeProductFromCart(cartItems);
                          },
                          child: SvgPicture.asset(
                            Assets.assetsImagesTrash,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItems.calculateTotalWeight()} ${S.of(context).kg}',
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        CartActionButtons(
                          cartItemEntity: cartItems,
                        ),
                        const Spacer(),
                        Text(
                          "${cartItems.calculateTotalPrice()} ${S.of(context).egp}",
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
      },
    );
  }
}
