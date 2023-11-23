import 'package:flutter/material.dart';

const String fontFamilyDefault = 'Muli';
const Color textColorDefault = Colors.black87;
const Color textColorGrey = Color.fromARGB(255, 116, 116, 116);
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
    // headline
    headlineLarge: textStyleBoldDefault.copyWith(fontSize: 28),
    headlineMedium: textStyleBoldDefault.copyWith(fontSize: 26),
    headlineSmall: textStyleBoldDefault.copyWith(fontSize: 24),
    // display
    displayLarge: textStyleBoldDefault.copyWith(fontSize: 22),
    displayMedium: textStyleBoldDefault.copyWith(fontSize: 20),
    displaySmall: textStyleBoldDefault.copyWith(fontSize: 18),
    // label
    labelLarge: textStyleRegularDefault.copyWith(fontSize: 26),
    labelMedium: textStyleRegularDefault.copyWith(fontSize: 24),
    labelSmall: textStyleRegularDefault.copyWith(fontSize: 22),
    // title
    titleLarge: textStyleRegularDefault.copyWith(fontSize: 20),
    titleMedium: textStyleRegularDefault.copyWith(fontSize: 18),
    titleSmall: textStyleRegularDefault.copyWith(fontSize: 16),
    // body
    bodyLarge: textStyleRegularDefault.copyWith(fontSize: 18),
    bodyMedium: textStyleRegularDefault.copyWith(fontSize: 16),
    bodySmall: textStyleRegularDefault.copyWith(fontSize: 14),
  );
}

InputDecorationTheme inputDecorationTheme() => const InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
