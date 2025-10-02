import 'package:flutter/material.dart';

abstract class MyColors {
  static const Color activIndicatorColor = Color(0xff1B5E37);
  static const Color inactivIndicatorColor = Color(0xffAEDCAB);

  // colors at light theme;
  static const Color kPrimaryColor =
      Color(0xff1B5E37); // buttons , background of icons, some text;

  static const Color kOnPrimaryColor = Color(
      0xffEEEEEE); // texts on buttons, icons, some text, scaffold background;

  static const Color kLightPrimaryColor =
      Color(0xff2D9F5D); // some buttons and borders;

  static const Color kPrimaryFixedColor =
      Color(0xFFF4A91F); // static subtitles;

  static const Color kSurfaceColor = Color(0XffF3F5F7); //all card background;
  static const Color kOnSurfaceColor = Color(0Xff0C0D0D); //all title color;

  static const Color kOnSurfaceVariantColor =
      Color(0xFF949D9E); //all subtitle color and title of TextField;

  static const Color kSurfaceContainerColor =
      Color(0XffF5FCF8); // another card background;

  static const Color kSurfaceDimmedColor =
      Color(0xFFEB5757); // another subtitle color;

  static const Color kSecondaryColor =
      Color(0xffF9FAFA); // background of TextFields;

  static const Color kOnSecondaryFixedColor =
      Color(0xFF23AA49); // title of products details;

  static const Color kSecondarycontainerColor =
      Color(0xFFFFFFFF); // dialog background color;

  static const Color kTertiaryColor = Color(0xFF4E5556); // about text color;

  static const Color kTertiaryFixedColor =
      Color(0xFFF8C76D); // static text of kilogram;

  static const Color kOnTertiaryFixedColor =
      Color(0xFFEBF9F1); // static text of Cart background header;

  // colors at dark theme;
  static const Color kDarkPrimaryColor =
      Color(0xff1B5E37); // buttons , background of icons, some text;

  static const Color kDarkOnPrimaryColor = Color(
      0xffEEEEEE); // texts on buttons, icons, some text, scaffold background;

  static const Color kDarkLightPrimaryColor =
      Color(0xff2D9F5D); // some buttons and borders;

  static const Color kDarkPrimaryFixedColor =
      Color(0xFFF4A91F); // static subtitles;

  static const Color kDarkSurfaceColor =
      Color(0Xff171717); //all card background;
  static const Color kDarkOnSurfaceColor = Color(0xFFFFFFFF); //all title color;

  static const Color kDarkOnSurfaceVariantColor =
      Color(0xFF949D9E); //all subtitle color and title of TextField;

  static const Color kDarkSurfaceContainerColor =
      Color(0Xff171717); // another card background;

  static const Color kDarkSurfaceDimmedColor =
      Color(0xFFFFFFFF); // another subtitle color;

  static const Color kDarkSecondaryColor =
      Color(0xff1E1E1E); // background of TextFields;

  static const Color kDarkOnSecondaryFixedColor =
      Color(0xFFFFFFFF); // title of products details;

  static const Color kDarkSecondarycontainerColor =
      Color(0xFF171717); // dialog background color;

  static const Color kDarkTertiaryColor =
      Color(0xFFFFFFFF); // about text color;

  static const Color kDarkTertiaryFixedColor =
      Color(0xFFF8C76D); // static text of kilogram;
  
  static const Color kDarkOnTertiaryFixedColor =
      Color(0xFF171717); // static text of Cart background header;
}
