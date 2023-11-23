import 'package:flutter/material.dart';

import "../../../../core/extensions/widget_extensions.dart";

class LabelTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? suffixIcon;

  const LabelTextField({super.key, this.label, this.hint, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(30));

    final focusBorder =
        border.copyWith(borderSide: BorderSide(color: context.primary));

    return TextField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        hintText: hint,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: suffixIcon,
        ),
        focusedBorder: focusBorder,
        border: border,
        focusColor: context.primary,
      ),
    );
  }
}
