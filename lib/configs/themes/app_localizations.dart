import 'dart:ui';

class AppLocalizations {
  const AppLocalizations._();

  static const Locale vi = Locale('vi', 'VN');
  static const Locale en = Locale('en', 'US');

  static const String path = 'assets/strings';

  static const Locale fallBackLocale = vi;

  static const List<Locale> supportedLocales = [vi, en];
}
