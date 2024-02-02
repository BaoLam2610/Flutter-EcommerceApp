import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/forgot_password/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/intro/intro_screen.dart';
import '../../features/auth/presentation/screens/login/login_screen.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';

class AppRoutes {
  static const String defaultPage = '';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return materialRoute(const SplashScreen());
      case IntroScreen.route:
        return materialRoute(const IntroScreen());
      case LoginScreen.route:
        return materialRoute(const LoginScreen());
      case ForgotPasswordScreen.route:
        return materialRoute(const ForgotPasswordScreen());
      default:
        return materialRoute(const SplashScreen());
    }
  }

  static Route<dynamic> materialRoute(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.route: (_) => const SplashScreen(),
    IntroScreen.route: (_) => const IntroScreen(),
  };
}
