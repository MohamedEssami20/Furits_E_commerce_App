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
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
        ),
        child: Row(
            children: getBottomNavigationBarEntityList(context)
                .asMap()
                .entries
                .map((entry) {
          int index = entry.key;
          var value = entry.value;
          return Expanded(
            flex: selectedIndex == index ? 4 : 2,
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
