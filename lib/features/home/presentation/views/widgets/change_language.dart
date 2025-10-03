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
    final ThemeData theme = Theme.of(context);
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
              Text(currentLang == "en" ? "English" : "العربية",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface,
                  )),
              SizedBox(
                width: 20,
                height: 25,
                child: PopupMenuButton(
                    color: theme.colorScheme.surface,
                    popUpAnimationStyle: const AnimationStyle(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.bounceInOut,
                    ),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: theme.colorScheme.onSurface,
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
                        PopupMenuItem(
                          value: "en",
                          height: 50,
                          enabled: true,
                          child: Text(
                            "English",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "ar",
                          child: Text(
                            "العربية",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
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
