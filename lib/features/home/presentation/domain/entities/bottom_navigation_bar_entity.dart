import '../../../../../core/utils/assets.dart';

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
            activeIcon: Assets.assetsImagesOutlineHomeIcon,
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
            inActiveIcon: Assets.assetsImagesBoldUserIcon,
            name: "حسابي"),
      ];
