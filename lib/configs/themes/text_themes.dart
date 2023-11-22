import 'package:flutter/material.dart';

const String fontFamilyDefault = 'Muli';
const Color textColorDefault = Colors.black87;
const double textHeight = 1.2;

const TextStyle textStyleRegularDefault = TextStyle(
  height: textHeight,
  color: textColorDefault,
);

const TextStyle textStyleBoldDefault = TextStyle(
  fontWeight: FontWeight.bold,
  height: textHeight,
  color: textColorDefault,
);

TextTheme textTheme() {
  return TextTheme(
    displayLarge: textStyleBoldDefault.copyWith(fontSize: 28),
    displayMedium: textStyleBoldDefault.copyWith(fontSize: 26),
    displaySmall: textStyleBoldDefault.copyWith(fontSize: 24),
    titleLarge: textStyleBoldDefault.copyWith(fontSize: 20),
    titleMedium: textStyleBoldDefault.copyWith(fontSize: 18),
    titleSmall: textStyleBoldDefault.copyWith(fontSize: 16),
    bodyLarge: textStyleRegularDefault.copyWith(fontSize: 18),
    bodyMedium: textStyleRegularDefault.copyWith(fontSize: 16),
    bodySmall: textStyleRegularDefault.copyWith(fontSize: 14),
  );
}
