import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentStep,
      required this.pageController,
      required this.onStepTapped});
  final int currentStep;
  final PageController pageController;
  final ValueChanged<int> onStepTapped;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getSteps(context).length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              onStepTapped(index);
            },
            child: StepItem(
              isActive: index <= currentStep,
              title: getSteps(context)[index],
              index: (index + 1).toString(),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> getSteps(BuildContext context) => [
      S.of(context).shipping,
      S.of(context).address,
      S.of(context).payment,
    ];
