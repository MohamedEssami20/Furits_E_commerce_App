import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/manager/wallet_cubit/wallet_cubit.dart';
import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';
import 'add_new_payment_card.dart';
import 'my_wallet_view_body.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    final inAddNewCard = context.watch<WalletCubit>().index == 1;
    log("inAddNewCard = $inAddNewCard");
    return Column(
      children: [
        buildAppBar(
          context,
          title: inAddNewCard == false ? "المدفوعات" : "إضافة بطاقة جديدة",
          showBackButton: true,
          showNotification: false,
          onBackPress: () {
            final inAddNewCard = context.read<WalletCubit>().index == 1;
            if (inAddNewCard) {
              context.read<WalletCubit>().changeIndex(0);
            } else {
              context.read<ProfileViewCubit>().changeIndex(0);
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<WalletCubit, int>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 270),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.1, 0), // يبدأ من اليمين
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: inAddNewCard == false
                  ? const MyWalletViewBody()
                  : const AddNewPaymentCard(),
            );
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          onPressed: () {
            final inAddNewCard = context.read<WalletCubit>().index == 1;
            if (inAddNewCard) {
              context.read<WalletCubit>().changeIndex(0);
            } else {
              context.read<WalletCubit>().changeIndex(1);
            }
          },
          title: "أضف وسيلة دفع جديدة",
        ),
      ],
    );
  }
}
