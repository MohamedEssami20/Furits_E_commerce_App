import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key, required this.currentIndex,
  });
  final int currentIndex ;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index:currentIndex ,
      children: const [
        HomeView(),
        ProductView(),
        CartView(),
      ],
    );
  }
}
