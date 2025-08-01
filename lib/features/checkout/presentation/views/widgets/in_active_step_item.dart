import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        CircleAvatar(
            backgroundColor: const Color(0xFFF2F3F3),
            radius: 13,
            child: Center(
              child: Text(
                "3",
                style: TextStyles.semiBold13.copyWith(
                  color: Colors.black,
                ),
              ),
            )),
        Text(
          'الدفع',
          style: TextStyles.semiBold13.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
      ],
    );
  }
}
