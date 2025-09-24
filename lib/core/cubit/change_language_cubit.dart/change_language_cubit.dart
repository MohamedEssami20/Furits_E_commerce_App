import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/constant/constant.dart';
import 'package:fruits_hub/core/services/shared_prefrence_sigelton.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit()
      : super(
          const ChangeLanguageInitial(
            Locale('ar'),
          ),
        );
  // create method that load saved language;
  Future<void> loadSavedLanguage() async {
    final String lang =
        SharedPrefrenceSigelton.getString(key: kAppLanguage) ?? 'ar';
    emit(ChangeLanguageSuccess(Locale(lang)));
  }

  // create method that change language
  void changeLanguage(String langCode) {
    final local = Locale(langCode);
    emit(ChangeLanguageLoading(local));
    emit(ChangeLanguageSuccess(local));
    SharedPrefrenceSigelton.setString(kAppLanguage, langCode);
  }
}
