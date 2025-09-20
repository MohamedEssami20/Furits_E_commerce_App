import 'package:flutter/material.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../core/utils/assets.dart';

class BottomNavigationBarEntity {
  final String activeIcon;
  final String inActiveIcon;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeIcon,
      required this.inActiveIcon,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarList => [
      BottomNavigationBarEntity(
          activeIcon: Assets.assetsImagesBoldHomeIcon,
          inActiveIcon: Assets.assetsImagesOutlineHomeIcon,
          name: "الرئيسية"),
      BottomNavigationBarEntity(
          activeIcon: Assets.assetsImagesBoldProductIcon,
          inActiveIcon: Assets.assetsImagesOutlineProductIcon,
          name: "المنتجات"),
      BottomNavigationBarEntity(
          activeIcon: Assets.assetsImagesBoldShoppingCart,
          inActiveIcon: Assets.assetsImagesOutlineShoppingCart,
          name: "سلة التسوق"),
      BottomNavigationBarEntity(
          activeIcon: Assets.assetsImagesBoldUserIcon,
          inActiveIcon: Assets.assetsImagesOutlineUserIcon,
          name: "حسابي"),
    ];

// create methodt that return list of BottomNavigationBarEntity with context as parameter;

List<BottomNavigationBarEntity> getBottomNavigationBarEntityList(BuildContext context) {
  return [   BottomNavigationBarEntity(
          activeIcon: Assets.assetsImagesBoldHomeIcon,
          inActiveIcon: Assets.assetsImagesOutlineHomeIcon,
          name: S.of(context).home),
      BottomNavigationBarEntity(
          activeIcon: Assets.assetsImagesBoldProductIcon,
          inActiveIcon: Assets.assetsImagesOutlineProductIcon,
          name: S.of(context).products),
      BottomNavigationBarEntity(
          activeIcon: Assets.assetsImagesBoldShoppingCart,
          inActiveIcon: Assets.assetsImagesOutlineShoppingCart,
          name: S.of(context).cart),
      BottomNavigationBarEntity(
          activeIcon: Assets.assetsImagesBoldUserIcon,
          inActiveIcon: Assets.assetsImagesOutlineUserIcon,
          name: S.of(context).profile),
    ];
}
