import 'package:flutter/material.dart';

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
