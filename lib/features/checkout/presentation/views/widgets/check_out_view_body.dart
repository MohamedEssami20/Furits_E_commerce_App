import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';

import 'checkout_page_view.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        currentPageIndex = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 32),
          CheckoutSteps(
            pageController: _pageController,
            currentStep: currentPageIndex,
          ),
          Expanded(
            child: CheckOutPageView(
              pageController: _pageController,
            ),
          ),
          CustomButton(
            onPressed: () {
              _pageController.animateToPage(
                currentPageIndex + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
              );
            },
            title: getTextPayment(),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  String getTextPayment() {
    switch (currentPageIndex) {
      case 0:
        return "التالى";
      case 1:
        return "التالى";
      case 2:
        return " الدفع عبر PayPal";
      default:
        return "التالى";
    }
  }
}
