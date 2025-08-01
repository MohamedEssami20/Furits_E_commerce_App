import 'package:flutter/material.dart';

import 'checkout_steps.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: getSteps().length,
    );
  }
}