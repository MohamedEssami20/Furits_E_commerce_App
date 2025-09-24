part of 'change_language_cubit.dart';

sealed class ChangeLanguageState extends Equatable {
  final Locale locale;
  const ChangeLanguageState(this.locale);

  @override
  List<Object> get props => [];
}

final class ChangeLanguageInitial extends ChangeLanguageState {
  const ChangeLanguageInitial(super.locale);
}

final class ChangeLanguageLoading extends ChangeLanguageState {
  const ChangeLanguageLoading(super.locale);
}

final class ChangeLanguageSuccess extends ChangeLanguageState {
  const ChangeLanguageSuccess(super.locale);
}
