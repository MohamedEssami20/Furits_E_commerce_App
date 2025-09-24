import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/cubit/change_language_cubit.dart/change_language_cubit.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../generated/l10n.dart';

class ChangeLangauge extends StatelessWidget {
  const ChangeLangauge({super.key});

  @override
  Widget build(BuildContext context) {
    final langCubit = context.read<ChangeLanguageCubit>();
    final String currentLang =
        context.watch<ChangeLanguageCubit>().state.locale.languageCode;
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
                currentLang == "en" ? "English" : "العربية",
                style: TextStyles.regular13.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 20,
                height: 25,
                child: PopupMenuButton(
                    color: const Color(0xffF2F3F3),
                    popUpAnimationStyle: const AnimationStyle(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.bounceInOut,
                    ),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                    onSelected: (value) {
                      langCubit.changeLanguage(value);
                      log("value = $value");
                    },
                    onCanceled: () {
                      log("onCanceled");
                    },
                    position: PopupMenuPosition.over,
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                    ),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: "en",
                          height: 50,
                          enabled: true,
                          child: Text(
                            "English",
                            style: TextStyles.bold13,
                          ),
                        ),
                        const PopupMenuItem(
                          value: "ar",
                          child: Text(
                            "العربية",
                            style: TextStyles.bold13,
                          ),
                        ),
                      ];
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
