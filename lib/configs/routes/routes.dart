import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login/login_provider.dart';
import '../../features/auth/presentation/screens/register/register_provider.dart';
import '../../features/intro/presentation/screens/intro_provider.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static const String splashRoute = '/';
  static const String introRoute = '/intro';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static Map<String, Widget Function(BuildContext)> routes = {
    splashRoute: (_) => const SplashScreen(),
    introRoute: (_) => const IntroProvider(),
    loginRoute: (_) => const LoginProvider(),
    registerRoute: (_) => const RegisterProvider(),
  };
}
