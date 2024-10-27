import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/active_bottom_navigation_bar_icon.dart';
import 'package:fruits_hub/core/utils/Widgets/in_acative_bottom_navigation_bar_icon.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/bottom_navigation_bar_entity.dart';

class BottomBNavigationBarItem extends StatelessWidget {
  const BottomBNavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? const AcativeBottomNavigationIcon()
        : const InAcativeBottomNavigationIcon(pathImage: Assets.assetsImagesOutlineHomeIcon);
  }
}