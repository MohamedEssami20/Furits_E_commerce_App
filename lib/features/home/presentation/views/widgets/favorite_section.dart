import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/get_dummy_products.dart';
import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';
import 'favorite_products_grid_view.dart';

class FavoriteSection extends StatelessWidget {
  const FavoriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppBar(context,
            title: "المفضلة",
            showBackButton: true,
            showNotification: false, onBackPress: () {
          context.read<ProfileViewCubit>().changeIndex(0);
        }),
        const SizedBox(
          height: 28,
        ),
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              FavoriteProductsGridView(
                products: getDummyProducts(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}