import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffDEDCDC),
          ),
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          "أو",
          style: TextStyles.semiBold16,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: Divider(
            color: Color(0xffDEDCDC),
          ),
        ),
      ],
    );
  }
}
