import 'package:flutter/material.dart';

import 'app_themes.dart';

class AppColors {
  final Color primary;
  final Color primarySup;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color critical;
  final Color primaryText;
  final Color secondaryText;
  final Color line;

  static late AppColors current;

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColors;
    current = appColor;
    return current;
  }

  const AppColors({
    required this.primary,
    required this.primarySup,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.critical,
    required this.primaryText,
    required this.secondaryText,
    required this.line,
  });

  static AppColors lightThemeColor = const AppColors(
    primary: Color(0xFFF85934),
    primarySup: Color(0xFFF8F2E2),
    secondary: Color(0xFF787982),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF5F5F5),
    critical: Color(0xFFE74141),
    primaryText: Color(0xFF151515),
    secondaryText: Color(0xFF787982),
    line: Color(0xFFE5E5E5),
  );

// static AppColors darkThemeColor = AppColors();
}
