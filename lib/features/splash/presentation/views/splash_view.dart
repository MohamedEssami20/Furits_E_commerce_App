
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/constant.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/shared_prefrence_sigelton.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/widgets/splash_view_body.dart';

import '../../../home/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const splashViewRoute = "Splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    execuiteNavigator();
    super.initState();
  }

  Future<void> execuiteNavigator() async {
    await Future.delayed(const Duration(seconds: 4), () {
      bool isLoggedIn = FirebaseAuthService().isUserAuthenticated();
      bool? isOnBoardingView =
          SharedPrefrenceSigelton.getBoolean(key: kIsOnBoardingViewSeen);
      if (isOnBoardingView == true) {
        if (isLoggedIn) {
          Navigator.of(mounted ? context : context)
              .pushReplacementNamed(HomeView.routeName);
        } else {
          Navigator.of(mounted ? context : context)
              .pushReplacementNamed(LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(
          mounted ? context : context,
          OnBoardingView.routeName,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}
