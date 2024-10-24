import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/services/shared_prefrence_sigelton.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/utils/app_text_style.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title,
      required this.visible});
  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.9,
                  child: SvgPicture.asset(image),
                ),
              ),
              Visibility(
                visible: visible,
                child: GestureDetector(
                  onTap: () {
                    SharedPrefrenceSigelton.setBoolean(
                        kIsOnBoardingViewSeen, true);
                    Navigator.of(context)
                        .pushReplacementNamed(LoginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      "تخط",
                      style: TextStyles.regular13
                          .copyWith(color: const Color(0xff949D9E)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),
        title,
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xff4E5456),
            ),
          ),
        ),
      ],
    );
  }
}
