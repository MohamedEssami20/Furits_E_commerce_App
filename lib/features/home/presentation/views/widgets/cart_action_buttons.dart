import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';

import '../../../../../core/utils/app_text_style.dart' show TextStyles;

class CartActionButtons extends StatelessWidget {
  const CartActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        CartActionButton(
          icon: Icons.add,
          iconColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateQuantity(cartItemEntity);
          },
        ),
        Text(
          cartItemEntity.count.toString(),
          textAlign: TextAlign.center,
          style: TextStyles.bold13.copyWith(color: Colors.black),
        ),
         CartActionButton(
          icon: Icons.remove,
          iconColor: Colors.grey,
          backgroundColor: const Color(0xFFF1F1F5),
          onPressed: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateQuantity(cartItemEntity);
          },
        ),
      ],
    );
  }
}

class CartActionButton extends StatelessWidget {
  const CartActionButton(
      {super.key,
      required this.iconColor,
      required this.backgroundColor,
      required this.icon,
      this.onPressed});
  final Color iconColor, backgroundColor;
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(3),
        decoration: ShapeDecoration(
          color: backgroundColor,
          /* Green1-500 */
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
