import 'package:flutter/material.dart';

ColorScheme colorScheme() {
  return ColorScheme.fromSeed(
    seedColor: Colors.deepOrangeAccent,
    primary: Colors.deepOrangeAccent,
    secondary: Colors.orange,
    surface: colorSurface,
  );
}

const colorLightGrey = Color(0xFFF5F6F9);
const colorSurface = Color(0xFFD8D8D8);
