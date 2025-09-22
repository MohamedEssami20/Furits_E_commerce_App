import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../generated/l10n.dart';

class ChangeLangauge extends StatelessWidget {
  const ChangeLangauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 7,
            children: [
              SvgPicture.asset(
                Assets.assetsImagesWorldIcon,
              ),
              Text(
               S.of(context).language,
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            spacing: 6,
            children: [
              Text(
                "العربية",
                style: TextStyles.regular13.copyWith(
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 19,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
