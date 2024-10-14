import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: OnBoardingPageView(),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: const DotsDecorator(
              size: Size(12, 12),
              activeSize: Size(12, 12),
              activeColor: MyColors.activIndicatorColor,
              color: MyColors.inactivIndicatorColor),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: CustomButton(onPressed: () {}, title: "ابدأ الان"),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
