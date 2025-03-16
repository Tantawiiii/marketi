import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routing/routes.dart';
import 'package:marketi/featuers/auth/login/view/login_screen.dart';
import 'package:marketi/featuers/auth/otp/cubit/otp_cubit.dart';
import 'package:marketi/featuers/auth/otp/view/otp_screen.dart';
import 'package:marketi/featuers/auth/register/cubit/register_cubit.dart';
import 'package:marketi/featuers/auth/register/view/register_screen.dart';
import 'package:marketi/featuers/home/home_screen.dart';

import '../../featuers/auth/login/cubit/login_cubit.dart';
import '../../featuers/onboarding/cubit/onboarding_cubit.dart';
import '../../featuers/onboarding/view/on_boarding_screen.dart';
import '../../featuers/onboarding/view/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    final arguments = setting.arguments;

    switch (setting.name) {
      case RRoutes.rSplash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RRoutes.rOnBoarding:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<OnBoardingCubit>(
                create: (context) => OnBoardingCubit(),
                child: OnBoardingScreen(),
              ),
        );
      case RRoutes.rLogin:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          ),
        );

      case RRoutes.rRegister:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: RegisterScreen(),
          ),
        );
      case RRoutes.rOtp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OtpCubit(),
            child: OtpScreen(),
          ),
        );
      case RRoutes.rHome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text("No Routes Find ${setting.name}")),
              ),
        );
    }
  }
}
