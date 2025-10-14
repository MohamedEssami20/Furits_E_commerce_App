import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/cubit/reviews_cubit_cubit.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/details_and_reviews_cubit/detais_and_reviews_cubit.dart';

import '../../../../core/entities/product_entity.dart';
import '../../domain/repos/reviews_repos.dart';
import '../widgets/products_details_view_body.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key, required this.productEntity});
  static const String routeName = 'product_details';
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DetailsAndReviewsCubit(),
          ),
          BlocProvider(
            create: (context) => ReviewsCubit(
              reviewsRepos: getIt.get<ReviewsRepos>(),
            ),
          ),
        ],
        child: ProductsDetailsViewBody(
          productEntity: productEntity,
        ),
      ),
    );
  }
}
