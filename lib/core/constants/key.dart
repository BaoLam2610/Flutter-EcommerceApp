import 'package:flutter/material.dart';

class AppKeys {
  const AppKeys._();

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'navigatorKey');

  static const String clickAction = 'click_action';
  static const String text = 'text';
  static const String image = 'image';

  static const String email = 'email';
  static const String password = 'password';
  static const String passwordConfirm = 'password_confirm';
  static const String userType = 'userType';
}
