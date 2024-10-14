import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.assetsImagesSplashPlanet),
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
}
