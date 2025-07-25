import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/bottom_navigation_bar_item.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_entity.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({
    super.key,
    required this.onTap,
  });
  final ValueChanged<int> onTap;
  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

int selectedIndex = 0;

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 400,
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
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Row(
            children: bottomNavigationBarList.asMap().entries.map((entry) {
          int index = entry.key;
          var value = entry.value;
          return Expanded(
            flex: selectedIndex == index ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onTap(index);
                });
              },
              child: BottomBNavigationBarItem(
                isSelected: selectedIndex == index,
                bottomNavigationBarEntity: value,
              ),
            ),
          );
        }).toList()),
      ),
    );
  }
}
