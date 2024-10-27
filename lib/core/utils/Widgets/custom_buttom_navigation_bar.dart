import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/bottom_navigation_bar_item.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/bottom_navigation_bar_entity.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({
    super.key,
  });
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavigationBarList.map((e) {
          return BottomBNavigationBarItem(
            isSelected: false,
            bottomNavigationBarEntity: BottomNavigationBarEntity(
                inActiveIcon: e.inActiveIcon,
                activeIcon: e.activeIcon,
                name: ""),
          );
        }).toList(),
      ),
    );
  }
}

