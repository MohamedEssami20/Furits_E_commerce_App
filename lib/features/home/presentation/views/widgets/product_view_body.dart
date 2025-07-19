import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';

import '../../../../../core/cubit/product_cubit/products_cubit.dart';
import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../../../../core/utils/Widgets/custom_search_text_field.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../best_selling/presentation/views/widgets/best_selling_gridview_bloc_builder.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(
                    title: "المنتجات",
                    context,
                    showBackButton: false,
                    showNotification: false),
                const SizedBox(
                  height: 20,
                ),
                const CustomSearchTextField(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                        " ${context.read<ProductsCubit>().resultOfProduct} نتايج",
                        style: TextStyles.bold16),
                    const Spacer(),
                    SvgPicture.asset(Assets.assetsImagesFilterIconTwo),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
