import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';

import '../../../../generated/l10n.dart';

class ProfileItemEntity {
  final String title;
  final String image;

  ProfileItemEntity({
    required this.title,
    required this.image,
  });

  // create list of 4 items
  static List<ProfileItemEntity> getProfileItems(BuildContext context) {
    return [
      ProfileItemEntity(
        title: S.of(context).profile,
        image: Assets.assetsImagesUserIcon,
      ),
      ProfileItemEntity(
        title: S.of(context).myOrders,
        image: Assets.assetsImagesOrdersIcon,
      ),
      ProfileItemEntity(
        title: S.of(context).payments,
        image: Assets.assetsImagesWalletIcon,
      ),
      ProfileItemEntity(
        title: S.of(context).favourites,
        image: Assets.assetsImagesHeartIcon,
      ),
    ];
  }

  static List<ProfileItemEntity> getHelpItems(BuildContext context) {
    return [
      ProfileItemEntity(
        title: S.of(context).aboutUs,
        image: Assets.assetsImagesInfoCircleIcon,
      ),
    ];
  }
}
