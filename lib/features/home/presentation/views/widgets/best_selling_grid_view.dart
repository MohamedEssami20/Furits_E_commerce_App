import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/fruits_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
            childAspectRatio: 163 / 214),
        itemBuilder: (context, index) => const FruitsItem(),
        itemCount: 50);
  }
}
