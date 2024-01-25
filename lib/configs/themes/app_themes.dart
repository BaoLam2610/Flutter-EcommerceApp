import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'color_themes.dart';
import 'text_themes.dart';
import 'widget_themes.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: fontFamilyDefault,
    textTheme: textTheme(),
    textSelectionTheme: textSelectionTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    colorScheme: colorScheme(),
    checkboxTheme: checkboxTheme(),
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

enum AppThemeType { light, dark }

/// Light theme
final lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  fontFamily: 'Muli',
  scaffoldBackgroundColor: AppColors.lightThemeColor.background,
)..addAppColor(
    AppThemeType.light,
    AppColors.lightThemeColor,
  );

/// Dark theme
// final darkTheme = ThemeData(brightness: Brightness.dark,
//   splashColor: Colors.transparent,
//   fontFamily: 'Muli',
//   scaffoldBackgroundColor: AppColors.darkThemeColor.blanco,)
//   ..addAppColor(AppThemeType.dark, AppColors.darkThemeColor,);

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppColors> _appColorMap = {};

  /// Add app color for new theme.

  void addAppColor(AppThemeType type, AppColors appColor) {
    _appColorMap[type] = appColor;
  }

  /// Get app color for current theme.
  AppColors get appColor {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ??
        AppColors.lightThemeColor;
  }
}

class AppThemeSetting {
  const AppThemeSetting._();

  static AppThemeType currentAppThemeType = AppThemeType.light;
}
