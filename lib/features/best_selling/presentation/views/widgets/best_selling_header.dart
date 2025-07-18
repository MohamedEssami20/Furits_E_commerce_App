import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best_selling/presentation/views/best_selling_view.dart';

import '../../../../../core/utils/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("الاكثر مبيعًا", style: TextStyles.bold16),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(BestSellingView.routeName);
            },
            child: const Text("المزيد", style: TextStyles.regular13)),
      ],
    );
  }
}
