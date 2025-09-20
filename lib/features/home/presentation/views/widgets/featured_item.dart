import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_button_item.dart';

import '../../../../../core/utils/app_text_style.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.sizeOf(context).width - 50;
    final directionality = Directionality.of(context);
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 220 / 126,
        child: Stack(
          children: [
            Positioned.directional(
              textDirection: Directionality.of(context),
              start: itemWidth * 0.4,
              top: 0,
              bottom: 0,
              child: SvgPicture.asset(
                Assets.assetsImagesOnboardingImage2, // image of fruit;
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: itemWidth * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: svg.Svg(
                      directionality == TextDirection.rtl
                          ? Assets.assetsImagesFeaturedBackgroundImage
                          : Assets.assetsImagesFeaturedBackgroundIamgeEnglish,
                    ), // green background;
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "عروض العيد",
                      style: TextStyles.regular13.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      "خصم 25%",
                      style: TextStyles.bold19.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16),
                      child: FeaturedButtonItem(onPressed: () {}),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
