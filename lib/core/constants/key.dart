import 'package:flutter/material.dart';

class AppKeys {
  const AppKeys._();

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'navigatorKey');

  static const String currentLocale = 'current_locale';
  static const String languageCode = 'language_code';
  static const String countryCode = 'country_code';

  static const String firstOpenApp = 'first_open_app';
  static const String clickAction = 'click_action';
  static const String text = 'text';
  static const String image = 'image';

  static const String email = 'email';
  static const String password = 'password';
  static const String passwordConfirm = 'password_confirm';
  static const String userType = 'userType';
  static const String rememberAccount = 'remember_account';

  static const String accessToken = 'access_token';

  /// Back to previous screen and reload data
  static const String popBackReload = 'pop_back_reload';
}
