import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_button_item.dart';

import '../../../../../core/utils/app_text_style.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 125,
        child: Stack(
          children: [
            // Image.asset(Assets.assetsImagesWaterMelonTestImage),
            Container(
              width: itemWidth * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: svg.Svg(Assets.assetsImagesFeaturedBackgroundImage),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 33),
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
                    FeaturedButtonItem(onPressed: () {}),
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