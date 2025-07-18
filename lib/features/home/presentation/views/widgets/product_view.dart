import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';

import '../../../../../core/cubit/product_cubit/products_cubit.dart';
import '../../../../../core/repos/product_repos.dart';
import 'product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductRepos>(),
      ),
      child: const ProductViewBody(),
    );
  }
}
