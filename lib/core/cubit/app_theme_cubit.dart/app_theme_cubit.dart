
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/constant/constant.dart';

import '../../services/shared_prefrence_sigelton.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit()
      : super(const AppThemeInitial(
          themeMode: ThemeMode.light,
        ));

  // create method that load the theme from shared preferences;
  void loadCurrentTheme() {
    final String themeMode =
        SharedPrefrenceSigelton.getString(key: kAppTheme) ?? kIsLight;
    if (themeMode == kIsLight) {
      emit(
        const AppThemeChangeSuccess(
          themeMode: ThemeMode.light,
        ),
      );
    } else {
      emit(
        const AppThemeChangeSuccess(
          themeMode: ThemeMode.dark,
        ),
      );
    }
  }

  // create method that change the theme;
  void changeTheme({required ThemeMode themeMode}) async {
    emit(AppThemeChangeLoading(themeMode: themeMode));
    emit(
      AppThemeChangeSuccess(
        themeMode: themeMode,
      ),
    );
    await SharedPrefrenceSigelton.setString(kAppTheme, themeMode.name);
  }
}
