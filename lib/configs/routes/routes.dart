import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login/login_provider.dart';
import '../../features/auth/presentation/screens/register/register_provider.dart';
import '../../features/category/category.dart';
import '../../features/home/home.dart';
import '../../features/intro/presentation/screens/intro_provider.dart';
import '../../features/main/presentation/main_provider.dart';
import '../../features/notification/notification.dart';
import '../../features/profile/presentation/screens/profile_provider.dart';
import '../../features/splash/presentation/screens/splash_provider.dart';
import '../../features/store/presentation/screens/store_provider.dart';

class AppRoutes {
  const AppRoutes._();

  static const String splashRoute = '/';
  static const String introRoute = '/intro';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String mainRoute = '/main';
  static const String homeRoute = '/home';
  static const String categoryRoute = '/category';
  static const String storeRoute = '/store';
  static const String notificationRoute = '/notification';
  static const String profileRoute = '/profile';

  static Map<String, Widget Function(BuildContext)> routes = {
    splashRoute: (_) => const SplashProvider(),
    introRoute: (_) => const IntroProvider(),
    loginRoute: (_) => const LoginProvider(),
    registerRoute: (_) => const RegisterProvider(),
    mainRoute: (_) => const MainProvider(),
    homeRoute: (_) => const HomeProvider(),
    categoryRoute: (_) => const CategoryProvider(),
    storeRoute: (_) => const StoreProvider(),
    notificationRoute: (_) => const NotificationProvider(),
    profileRoute: (_) => const ProfileProvider(),
  };
}
