import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedItemListView extends StatelessWidget {
  const FeaturedItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.hardEdge,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) {
            return const Padding(
              padding: EdgeInsets.only(right: 12),
              child: FeaturedItem(),
            );
          },
        ),
      ),
    );
  }
}
