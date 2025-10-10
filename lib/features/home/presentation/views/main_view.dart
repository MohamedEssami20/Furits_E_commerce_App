import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_buttom_navigation_bar.dart';
import 'package:fruits_hub/features/best_selling/presentation/manager/favorite_product_cubit/favorite_products_cubit.dart';
import 'package:fruits_hub/features/home/presentation/manager/change_to_notification_view/change_to_notification_view_cubit.dart';
import 'package:fruits_hub/features/home/presentation/manager/profile_view_cubit/profile_view_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/main_view_body_bloc_listener.dart';

import '../../../../core/helper/exit_app_dialog.dart';
import '../../../../core/repos/product_repos.dart';
import '../manager/get_favorite_products_cubit/get_favorite_product_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

int selectedIndex = 0;

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetFavoriteProductCubit(
            productRepos: getIt.get<ProductRepos>(),
          ),
        ),
        BlocProvider(
          create: (context) => FavoriteProductsCubit(
            productRepos: getIt.get<ProductRepos>(),
          ),
        ),
        BlocProvider(
          create: (context) => ChangeToNotificationViewCubit(),
        ),
      ],
      child: Scaffold(
          bottomNavigationBar: CustomButtomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;
              if (!didPop) {
                final profileView = context.read<ProfileViewCubit>().index;
                if (selectedIndex == 3 && profileView == -1) {
                  showExitDialog(context);
                  return;
                } else if (selectedIndex == 3 && profileView != 0) {
                  context.read<ProfileViewCubit>().changeIndex(0);
                  return;
                } else {
                  showExitDialog(context);
                  return;
                }
              }
            },
            child: SafeArea(
              child: MainViewBodyBlocListener(
                selectedIndex: selectedIndex,
              ),
            ),
          )),
    );
  }
}
