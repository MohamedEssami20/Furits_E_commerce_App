import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: SizedBox(
            width: 50,
            child: const InAcativeIcon(
                pathImage: Assets.assetsImagesOutlineHomeIcon)),
      ),
    );
  }
}

class InAcativeIcon extends StatelessWidget {
  const InAcativeIcon({super.key, required this.pathImage});
  final String pathImage;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      pathImage,
    );
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BottomBNavigationBarItem extends StatelessWidget {
  const BottomBNavigationBarItem({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected?
        const ActiveItem() : const InAcativeIcon(pathImage: Assets.assetsImagesOutlineHomeIcon);
  }
}
