import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/details_and_reviews_cubit/detais_and_reviews_cubit.dart';
import '../view/reviews_view.dart';
import 'details_view_section.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final textDirection = Directionality.of(context);
    final theme = Theme.of(context);
    return BlocBuilder<DetailsAndReviewsCubit, int>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.1, 0), // يبدأ من اليمين
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: buildDetailsView(
            productEntity: productEntity,
            height: height,
            theme: theme,
            textDirection: textDirection,
            context: context,
            index: state,
          ),
        );
      },
    );
  }
}

Widget buildDetailsView(
    {required ProductEntity productEntity,
    required double height,
    required ThemeData theme,
    required TextDirection textDirection,
    required BuildContext context,
    required int index}) {
  switch (index) {
    case 0:
      return DetailsViewSection(
        productEntity: productEntity,
        height: height,
        theme: theme,
        textDirection: textDirection,
      );
    case 1:
      return ReviewsView(
        productId: productEntity.id,
      );
    default:
      return DetailsViewSection(
        productEntity: productEntity,
        height: height,
        theme: theme,
        textDirection: textDirection,
      );
  }
}
