import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubit/product_cubit/products_cubit.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_list_view.dart';

import 'best_selling_gridview_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

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
                FeaturedItemListView(),
                SizedBox(
                  height: 20,
                ),
                BestSellingHeader(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}

