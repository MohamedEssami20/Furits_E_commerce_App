import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/details_and_reviews_cubit/detais_and_reviews_cubit.dart';

import '../../../../core/entities/product_entity.dart';
import '../widgets/products_details_view_body.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key, required this.productEntity});
  static const String routeName = 'product_details';
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DetailsAndReviewsCubit(),
        child: ProductsDetailsViewBody(
          productEntity: productEntity,
        ),
      ),
    );
  }
}
