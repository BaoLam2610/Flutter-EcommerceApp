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

  static const MaterialColor primaryMaterialColor =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFFEEBE7),
    100: Color(0xFFFDCDC2),
    200: Color(0xFFFCAC9A),
    300: Color(0xFFFA8B71),
    400: Color(0xFFF97252),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFFF7512F),
    700: Color(0xFFF64827),
    800: Color(0xFFF53E21),
    900: Color(0xFFF32E15),
  });
  static const int _primaryPrimaryValue = 0xFFF85934;

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
    primary: Color(_primaryPrimaryValue),
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
