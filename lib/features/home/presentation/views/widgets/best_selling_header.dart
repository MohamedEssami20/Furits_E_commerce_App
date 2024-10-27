import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("الاكثر مبيعًا", style: TextStyles.bold16),
         Spacer(),
        Text("المزيد", style: TextStyles.regular13),
      ],
    );
  }
}