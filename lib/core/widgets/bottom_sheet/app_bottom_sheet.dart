import 'package:flutter/material.dart';

class AppBottomSheet {
  const AppBottomSheet._();

  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
    required Widget child,
  }) {
    return showModalBottomSheet(
      context: context,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (context) => Wrap(children: [child]),
    );
  }
}
