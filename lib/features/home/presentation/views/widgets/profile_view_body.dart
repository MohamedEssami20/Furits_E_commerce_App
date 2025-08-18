import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';
import 'account_section.dart';
import 'edit_profile_section.dart';
import 'favorite_section.dart';
import 'help_section.dart';
import 'my_orders_section.dart' show MyOrdersSection;
import 'wallet_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  Widget _buildSection(int index) {
    switch (index) {
      case 0:
        return const AccountSection();
      case 1:
        return const EditProfileSection();
      case 2:
        return const MyOrdersSection();
      case 3:
        return const WalletSection();
      case 4:
        return const FavoriteSection();
      case 5:
        return const HelpSection();
      default:
        return const AccountSection();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: BlocBuilder<ProfileViewCubit, int>(
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
            child: _buildSection(state),
          );
        },
      ),
    );
  }
}
