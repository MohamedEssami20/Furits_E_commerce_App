import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/products_details/presentation/widgets/another_details_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../core/utils/assets.dart';

class AnotherDetailsGridView extends StatelessWidget {
  const AnotherDetailsGridView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsetsDirectional.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2.1,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => AnotherProductsDetailsItem(
        value: getAnotherDetailsValue(productEntity)[index],
        title:
            AnotherProductsDetailsItems.getAnotherDetailsItems(context)[index]
                .title,
        image:
            AnotherProductsDetailsItems.getAnotherDetailsItems(context)[index]
                .image,
      ),
    );
  }
}

List<String> getAnotherDetailsValue(ProductEntity productEntity) {
  return [
    productEntity.expeireationMonths.toString(),
    productEntity.isOraganic ? "100%" : "0%",
    productEntity.numberOfCalories.toString(),
  ];
}

class AnotherProductsDetailsItems {
  final String title;
  final String image;
  AnotherProductsDetailsItems({required this.title, required this.image});

  static List<AnotherProductsDetailsItems> getAnotherDetailsItems(
      BuildContext context) {
    return [
      AnotherProductsDetailsItems(
        title: S.of(context).expiry,
        image: Assets.assetsImagesCalendar,
      ),
      AnotherProductsDetailsItems(
        title: S.of(context).organic,
        image: Assets.assetsImagesLotus,
      ),
      AnotherProductsDetailsItems(
        title: S.of(context).calories,
        image: Assets.assetsImagesCalory,
      ),
      AnotherProductsDetailsItems(
        title: S.of(context).reviews,
        image: Assets.assetsImagesFavorite,
      ),
    ];
  }
}
