import 'package:flutter/material.dart';

import 'app_themes.dart';

class AppColors {
  final Color primary;
  final Color background;

  static late AppColors current;

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;
    current = appColor;
    return current;
  }

  const AppColors({
    required this.primary,
    required this.background,
  });

  static AppColors lightThemeColor = const AppColors(
    primary: Color(0xFFF85934),
    background: Color(0xFFFFFFFF),
  );

// static AppColors darkThemeColor = AppColors();
}
