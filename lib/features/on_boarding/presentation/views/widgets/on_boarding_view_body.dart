import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Expanded(
          child: OnBoardingPageView(pageController: pageController,),
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
