import 'package:fruits_hub/core/utils/assets.dart';

class ProfileItemEntity {
  final String title;
  final String image;

  ProfileItemEntity({
    required this.title,
    required this.image,
  });

  // create list of 4 items
  static List<ProfileItemEntity> getProfileItems() {
    return [
      ProfileItemEntity(
        title: "الملف الشخصي",
        image: Assets.assetsImagesUserIcon,
      ),
      ProfileItemEntity(
        title: "طلباتي",
        image: Assets.assetsImagesOrdersIcon,
      ),
      ProfileItemEntity(
        title: "المدفوعات",
        image: Assets.assetsImagesWalletIcon,
      ),
      ProfileItemEntity(
        title: "المفضلة",
        image: Assets.assetsImagesHeartIcon,
      ),
    ];
  }

  static List<ProfileItemEntity> getHelpItems() {
    return [
      ProfileItemEntity(
        title: " من نحن",
        image: Assets.assetsImagesInfoCircleIcon,
      ),
    ];
  }
}
