import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: const [
        PageViewItem(
          image: Assets.assetsImagesOnboardingImage1,
          backgroundImage: Assets.assetsImagesOnboardingBackgroundImage,
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("مرحبًا بك في "),
              Text("HUB"),
              Text("Fruit"),
            ],
          ),
        ),
        PageViewItem(
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
