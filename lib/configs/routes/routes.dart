import 'package:flutter/material.dart';

import '../../features/auth/domain/models/register/user_register.dart';
import '../../features/auth/presentation/pages/complete_profile/complete_profile_page.dart';
import '../../features/auth/presentation/pages/forgot_password/forgot_password_page.dart';
import '../../features/auth/presentation/pages/intro/intro_page.dart';
import '../../features/auth/presentation/pages/login/login_page.dart';
import '../../features/auth/presentation/pages/register/register_page.dart';

class AppRoutes {
  static const String defaultPage = '';
  static const String introPage = '/intro';
  static const String loginPage = '/login';
  static const String registerPage = '/register';
  static const String completeProfilePage = '/completeProfile';
  static const String forgotPasswordPage = '/forgotPassword';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case introPage:
        return materialRoute(const IntroPage());
      case loginPage:
        return materialRoute(const LoginPage());
      case registerPage:
        return materialRoute(const RegisterPage());
      case completeProfilePage:
        return materialRoute(
          CompleteProfilePage(
            args: settings.arguments as UserRegister,
          ),
        );
      case forgotPasswordPage:
        return materialRoute(const ForgotPasswordPage());
      default:
        return materialRoute(const IntroPage());
    }
  }

  static Route<dynamic> materialRoute(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
