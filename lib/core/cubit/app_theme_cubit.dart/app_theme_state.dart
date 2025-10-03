part of 'app_theme_cubit.dart';

sealed class AppThemeState extends Equatable {
  final ThemeMode themeMode;
  const AppThemeState({required this.themeMode});
  @override
  List<Object> get props => [];
}

final class AppThemeInitial extends AppThemeState {
  const AppThemeInitial({required super.themeMode});
}

final class AppThemeChangeLoading extends AppThemeState {
  const AppThemeChangeLoading({required super.themeMode});
}

final class AppThemeChangeSuccess extends AppThemeState {
  const AppThemeChangeSuccess({required super.themeMode});
}
