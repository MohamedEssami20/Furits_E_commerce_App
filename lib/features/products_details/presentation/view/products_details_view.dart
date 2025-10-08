import 'package:flutter/material.dart';

import '../widgets/products_details_view_body.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});
  static const String routeName = 'product_details';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductsDetailsViewBody(),
    );
  }
}
