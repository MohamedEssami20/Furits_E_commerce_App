import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem(
      {super.key, required this.index, required this.tiltle});
  final String index, tiltle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        CircleAvatar(
            backgroundColor: const Color(0xFFF2F3F3),
            radius: 13,
            child: Center(
              child: Text(
                index,
                style: TextStyles.semiBold13.copyWith(
                  color: Colors.black,
                ),
              ),
            )),
        Text(
          tiltle,
          style: TextStyles.semiBold13.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
      ],
    );
  }
}
