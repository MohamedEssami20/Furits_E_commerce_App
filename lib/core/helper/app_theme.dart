import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

class AppTheme {
  // light theme
  static ThemeData lightTheme() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor:
          MyColors.kPrimaryColor, // buttons , background of icons, some text;
      primary:
          MyColors.kPrimaryColor, // buttons , background of icons, some text;
      onPrimary: MyColors
          .kOnPrimaryColor, // texts on buttons, icons, some text, scaffold background;
      primaryFixed: MyColors.kPrimaryFixedColor, // static subtitles;
      surface: MyColors.kSurfaceColor, //all card background;
      onSurface: MyColors.kOnSurfaceColor, //all title color;
      onSurfaceVariant: MyColors
          .kOnSurfaceVariantColor, //all subtitle color and title of TextField;
      surfaceContainer: MyColors
          .kSurfaceContainerColor, // another card background color of notification;
      surfaceDim: MyColors
          .kSurfaceDimmedColor, // another subtitle color of notification;
      secondary: MyColors.kSecondaryColor, // background of TextFields;
      onSecondaryFixed:
          MyColors.kOnSecondaryFixedColor, // title of products details;
      secondaryContainer:
          MyColors.kSecondarycontainerColor, // dialog background;
      tertiary: MyColors.kTertiaryColor, // about us text color;
      tertiaryFixed:
          MyColors.kTertiaryFixedColor, // subtitle of products kilogram;
      onTertiaryFixed:
          MyColors.kOnTertiaryFixedColor, // cart background header;
      brightness: Brightness.light,
    );
    return ThemeData(
      fontFamily: "Cairo",
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xffFFFFFF),
      primaryColor: colorScheme.primary,
      textTheme: appTextTheme(),
    );
  }

  // dark theme
  static ThemeData darkTheme() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor:
          MyColors.kPrimaryColor, // buttons , background of icons, some text;
      primary: MyColors
          .kDarkPrimaryColor, // buttons , background of icons, some text;
      onPrimary: MyColors
          .kDarkOnPrimaryColor, // texts on buttons, icons, some text, scaffold background;
      primaryFixed: MyColors.kDarkPrimaryFixedColor, // static subtitles;
      surface: MyColors.kDarkSurfaceColor, //all card background;
      onSurface: MyColors.kDarkOnSurfaceColor, //all title color;
      onSurfaceVariant: MyColors
          .kDarkOnSurfaceVariantColor, //all subtitle color and title of TextField;
      surfaceContainer: MyColors
          .kDarkSurfaceContainerColor, // another card background color of notification;
      surfaceDim: MyColors
          .kDarkSurfaceDimmedColor, // another subtitle color of notification;
      secondary: MyColors.kDarkSecondaryColor, // background of TextFields;
      onSecondaryFixed:
          MyColors.kDarkOnSecondaryFixedColor, // title of products details;
      secondaryContainer:
          MyColors.kDarkSecondarycontainerColor, // dialog background;
      tertiary: MyColors.kDarkTertiaryColor, // about us text color;
      tertiaryFixed:
          MyColors.kDarkTertiaryFixedColor, // subtitle of products kilogram;
      onTertiaryFixed:
          MyColors.kDarkOnTertiaryFixedColor, // cart background header;
      brightness: Brightness.dark,
    );
    return ThemeData(
      fontFamily: "Cairo",
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xff0D0D0D),
      primaryColor: colorScheme.primary,
      textTheme: appTextTheme(),
    );
  }

  static TextTheme appTextTheme() {
    return const TextTheme(
      displayLarge: TextStyles.bold28,
      displayMedium: TextStyles.bold23,
      displaySmall: TextStyles.bold19,
      headlineLarge: TextStyles.bold16,
      headlineMedium: TextStyles.semiBold16,
      headlineSmall: TextStyles.medium15,
      titleLarge: TextStyles.regular22,
      titleMedium: TextStyles.regular16,
      titleSmall: TextStyles.semiBold13,
      bodyLarge: TextStyles.regular26,
      bodyMedium: TextStyles.regular13,
      bodySmall: TextStyles.regular11,
      labelLarge: TextStyles.bold13,
      labelMedium: TextStyles.semiBold11,
      labelSmall: TextStyles.regular11,
    );
  }
}
