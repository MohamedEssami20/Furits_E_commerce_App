import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubit/product_cubit/products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper/get_dummy_products.dart';
import '../../../../../core/utils/Widgets/custom_error_widget.dart';
import 'best_selling_grid_view.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellingGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errorMessage: state.errormessage,
            ),
          );
        }
        return Skeletonizer.sliver(
          enabled: true,
          child: BestSellingGridView(
            products: getDummyProducts(),
          ),
        );
      },
    );
  }
}
