import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/in_active_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getSteps().length,
        (index) => Expanded(
          child: InActiveStepItem(
            tiltle: getSteps()[index],
            index: (index + 1).toString(),
          ),
        ),
      ),
    );
  }

  List<String> getSteps() => [
        "الشحن",
        "العنوان",
        "الدفع",
        "المرجعة",
      ];
}
