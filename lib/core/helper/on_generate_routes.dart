import 'package:flutter/material.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings? routeSettings) {
  switch (routeSettings!.name) {
    case SplashView.splashViewRoute:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold(),);
  }
}