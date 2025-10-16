import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubit/product_cubit/products_cubit.dart';
import 'package:fruits_hub/core/helper/get_user_data.dart';
import 'package:fruits_hub/features/best_selling/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import 'package:fruits_hub/features/home/presentation/manager/get_user_cubit/get_user_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_list_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper/get_user_dummu_data.dart';
import '../../../../../core/utils/Widgets/custom_search_text_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read<ProductsCubit>()
        .getProducts(genralErrorMessage: S.of(context).errorMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 18),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                BlocBuilder<GetUserCubit, GetUserState>(
                  builder: (context, state) {
                    if (state is GetUserSuccess) {
                      return CustomHomeAppbar(
                        userEntity: state.user,
                      );
                    } else if (state is GetUserFailure) {
                      return CustomHomeAppbar(
                        userEntity: getUserData(),
                      );
                    } else {
                      return Skeletonizer(
                        child: CustomHomeAppbar(
                          userEntity: getDummyUserEntity(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomSearchTextField(),
                const SizedBox(
                  height: 30,
                ),
                const FeaturedItemListView(),
                const SizedBox(
                  height: 20,
                ),
                const BestSellingHeader(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const BestSellingViewBody(),
        ],
      ),
    );
  }
}
