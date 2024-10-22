import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/constant.dart';
import 'package:fruits_hub/core/services/shared_prefrence_sigelton.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

import '../../../../auth/presentation/views/signin_view.dart';

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
      setState(() {});
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
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            size: const Size(12, 12),
            activeSize: const Size(12, 12),
            activeColor: MyColors.activIndicatorColor,
            color: currentPage == 0
                ? MyColors.inactivIndicatorColor
                : MyColors.activIndicatorColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Visibility(
          visible: currentPage == 0 ? false : true,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomButton(
              onPressed: () {
                SharedPrefrenceSigelton.setBoolean(kIsOnBoardingViewSeen, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              title: "ابدأ الان",
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
