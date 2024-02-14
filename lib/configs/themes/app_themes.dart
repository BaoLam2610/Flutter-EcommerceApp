import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import 'app_colors.dart';

enum AppThemeType { light, dark }

/// Light theme
final lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  fontFamily: FontFamily.muli,
  scaffoldBackgroundColor: AppColors.lightThemeColor.background,
  primarySwatch: AppColors.primaryMaterialColor
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
  AppColors get appColors {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ??
        AppColors.lightThemeColor;
  }
}

class AppThemeSetting {
  const AppThemeSetting._();

  static AppThemeType currentAppThemeType = AppThemeType.light;
}
