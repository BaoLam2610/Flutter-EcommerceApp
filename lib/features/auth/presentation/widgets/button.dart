import 'package:flutter/material.dart';

import '../../../../configs/themes/button_themes.dart';
import '../../../../configs/themes/dimens.dart';
import '../../../../core/extensions/widget_extensions.dart';

class Button extends StatelessWidget {
  final String text;
  const Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeightLarge,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: primaryDefaultRoundedButtonTheme,
        child: Text(
          text,
          style: context.buttonTextTheme,
        ),
      ),
    );
  }
}
