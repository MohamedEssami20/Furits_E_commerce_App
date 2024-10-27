import 'package:flutter/widgets.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';

import '../../../../../core/utils/Widgets/custom_search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppbar(),
                SizedBox(
                  height: 20,
                ),
                CustomSearchTextField(),
                SizedBox(
                  height: 30,
                ),
                FeaturedItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
