import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/manager/change_to_notification_view/change_to_notification_view_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/home/presentation/views/notification_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: [
        BlocBuilder<ChangeToNotificationViewCubit, int>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
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
              child: _buildBody(state),
            );
          },
        ),
        const ProductView(),
        const CartView(),
        const ProfileView(),
      ],
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const NotificationView();
      default:
        return const HomeView();
    }
  }
}
