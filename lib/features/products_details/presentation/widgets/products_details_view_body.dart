import 'package:flutter/material.dart';
import 'products_details_appbar.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final textDirection = Directionality.of(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        ProductsDetailsAppBar(
          height: height,
          theme: theme,
          textDirection: textDirection,
        ),
      ],
    );
  }
}
