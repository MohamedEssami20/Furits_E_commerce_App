import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/cubit/app_theme_cubit.dart/app_theme_cubit.dart';
import 'package:fruits_hub/core/cubit/change_language_cubit.dart/change_language_cubit.dart';
import 'package:fruits_hub/core/helper/app_theme.dart';
import 'package:fruits_hub/core/helper/on_generate_routes.dart';
import 'package:fruits_hub/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/services/shared_prefrence_sigelton.dart';
import 'package:fruits_hub/features/home/presentation/manager/edit_user_info_cubit/user_cubit.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub/generated/l10n.dart';

import 'core/services/supabase_storage_services.dart';
import 'features/home/domain/repos/home_repo.dart';
import 'features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'features/home/presentation/manager/get_user_cubit/get_user_cubit.dart';
import 'features/home/presentation/manager/profile_view_cubit/profile_view_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SupabaseStorageServices.initSupabase();
  setupGetIt();
  Bloc.observer = CustomBlocObserver();
  await SharedPrefrenceSigelton.init();
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  firebaseAuthService.authStateChanges();
  firebaseAuthService.idTokenChanges();
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(
            homeRepo: getIt.get<HomeRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => ChangeLanguageCubit()..loadSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => AppThemeCubit()..loadCurrentTheme(),
        ),
        BlocProvider(
          create: (context) => ProfileViewCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => CartItemCubit(),
        ),
        BlocProvider(
          create: (context) => GetUserCubit(
            homeRepo: getIt.get<HomeRepo>(),
          ),
        ),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, stateOne) {
          return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
            builder: (context, state) {
              return MaterialApp(
                theme: AppTheme.lightTheme(),
                darkTheme: AppTheme.darkTheme(),
                themeMode: stateOne.themeMode,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: state.locale,
                onGenerateRoute: onGenerateRoute,
                initialRoute: SplashView.splashViewRoute,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
