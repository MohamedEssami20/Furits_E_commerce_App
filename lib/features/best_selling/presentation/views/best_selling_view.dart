import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import '../../../../core/utils/Widgets/build_appbar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'BestSellingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "الأكثر مبيعًا", context: context),
      body: const BestSellingViewBody(),
    );
  }
}
