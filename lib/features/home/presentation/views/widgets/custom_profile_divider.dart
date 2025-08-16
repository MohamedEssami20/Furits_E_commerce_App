import 'package:flutter/material.dart';

class CustomProfileDivider extends StatelessWidget {
  const CustomProfileDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: Color(0xfff2f3f3),
      height: 22,
    );
  }
}