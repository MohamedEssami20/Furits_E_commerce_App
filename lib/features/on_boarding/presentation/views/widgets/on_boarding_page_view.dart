import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

import '../../../../../core/utils/app_text_style.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: [
        PageViewItem(
          visible: true,
          image: Assets.assetsImagesOnboardingImage1,
          backgroundImage: Assets.assetsImagesOnboardingBackgroundImage,
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "مرحبًا بك في ",
                style:
                    TextStyles.bold13.copyWith(color: const Color(0xff0C0D0D)),
              ),
              Text(
                "HUB",
                style: TextStyles.bold23.copyWith(
                  color: const Color(0xfff4A91f),
                ),
              ),
              Text(
                "Fruit",
                style: TextStyles.bold23
                    .copyWith(color: MyColors.activIndicatorColor),
              ),
            ],
          ),
        ),
        const PageViewItem(
          visible: false,
          image: Assets.assetsImagesOnboardingImage2,
          backgroundImage: Assets.assetsImagesOnboardBacgroundImage2,
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ابحث وتسوق"),
            ],
          ),
        ),
      ],
    );
  }
}
