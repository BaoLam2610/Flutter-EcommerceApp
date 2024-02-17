import 'package:flutter/material.dart';

extension BuildContextExtensions<T> on BuildContext {
  ThemeData get theme => Theme.of(this);

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /* Size */
  bool get isMobile => mediaQuery.size.width <= 500.0;

  bool get isTablet =>
      mediaQuery.size.width < 1024.0 && mediaQuery.size.width >= 650.0;

  bool get isSmallTablet =>
      mediaQuery.size.width < 650.0 && mediaQuery.size.width > 500.0;

  bool get isDesktop => mediaQuery.size.width >= 1024.0;

  bool get isSmall =>
      mediaQuery.size.width < 850.0 && mediaQuery.size.width >= 560.0;

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  Size get size => mediaQuery.size;
}
