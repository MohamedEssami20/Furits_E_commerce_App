import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_buttom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_view.dart';

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
    return Scaffold(
        bottomNavigationBar: CustomButtomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
          child: IndexedStack(
            index: selectedIndex,
            children: const [
              HomeView(),
              ProductView(),
              CartView(),
            ],
          ),
        ));
  }
}
