import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/bottom_navigation_bar_item.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/bottom_navigation_bar_entity.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({
    super.key,
  });

  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int selectedIndex = 0;
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
          children: bottomNavigationBarList.asMap().entries.map((entry) {
            int index = entry.key;
            var value = entry.value;
            return Expanded(
              flex: selectedIndex == index ? 3 : 2,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
                child: BottomBNavigationBarItem(
                  isSelected: selectedIndex == index,
                  bottomNavigationBarEntity: value,
                ),
              ),
            );
          }).toList()),
    );
  }
}
