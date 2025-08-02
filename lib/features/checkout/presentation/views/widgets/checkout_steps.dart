import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart'
    show OrderEntity;
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key, required this.currentStep, required this.pageController});
  final int currentStep;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final orderEntity = context.read<OrderEntity>();
    return Row(
      children: List.generate(
        getSteps().length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              if (orderEntity.payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                buildErrorSnackBar(context, "اختر طريقة الدفع");
              }
            },
            child: StepItem(
              isActive: index <= currentStep,
              title: getSteps()[index],
              index: (index + 1).toString(),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> getSteps() => [
      "الشحن",
      "العنوان",
      "الدفع",
    ];
