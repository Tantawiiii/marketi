import 'package:flutter/material.dart';
import 'package:marketi/core/routing/routes.dart';
import 'package:marketi/featuers/auth/view/on_boarding_screen.dart';
import 'package:marketi/featuers/auth/view/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    final arguments = setting.arguments;

    switch (setting.name) {
      case RRoutes.rSplash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        case RRoutes.rOnBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(
          child: Text("No Routes Find ${setting.name}"),
        )));
    }
  }
}
