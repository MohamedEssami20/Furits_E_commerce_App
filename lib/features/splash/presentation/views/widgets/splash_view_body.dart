import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isArabicLang = isArabic(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.rotate(
                angle: isArabicLang ? 0 : 1.8,
                child: SvgPicture.asset(Assets.assetsImagesSplashPlanet)),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesSplash1Icon),
        SvgPicture.asset(
          Assets.assetsImagesSplashBottomIcon,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  bool isArabic(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'ar';
  }
}
