import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/intro/intro_page.dart';
import '../../features/auth/presentation/pages/login/login_page.dart';

class AppRoutes {
  static const String defaultPage = '';
  static const String introPage = '/intro';
  static const String loginPage = '/login';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case introPage:
        return materialRoute(const IntroPage());
      case loginPage:
        return materialRoute(const LoginPage());
      default:
        return materialRoute(const LoginPage());
    }
  }

  static Route<dynamic> materialRoute(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
