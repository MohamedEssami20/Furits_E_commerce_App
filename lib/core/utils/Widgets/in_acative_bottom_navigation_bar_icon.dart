import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InAcativeBottomNavigationIcon extends StatelessWidget {
  const InAcativeBottomNavigationIcon({super.key, required this.pathImage});
  final String pathImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SvgPicture.asset(
        pathImage,
        width: 25,
      ),
    );
  }
}
