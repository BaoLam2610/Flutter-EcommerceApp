import 'package:flutter/material.dart';

import '../../features/intro/presentation/screens/intro_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.route: (_) => const SplashScreen(),
    IntroScreen.route: (_) => const IntroScreen(),
  };
}
