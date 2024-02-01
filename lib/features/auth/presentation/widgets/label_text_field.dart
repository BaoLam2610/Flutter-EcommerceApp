import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/themes/themes.dart';

class LabelTextField extends StatelessWidget {
  final Function(String text)? onChanged;
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Icon? suffixIcon;
  final SvgPicture? suffixVectorIcon;
  final TextInputType? inputType;
  final bool? isPassword;

  const LabelTextField({
    super.key,
    this.label,
    this.hint,
    this.suffixIcon,
    this.inputType,
    this.isPassword,
    this.controller,
    this.suffixVectorIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(30));

    final focusBorder = border.copyWith(
        borderSide: BorderSide(color: AppColors.current.primary));

    return TextField(
      onChanged: onChanged,
      controller: controller,
      maxLines: 1,
      obscureText: isPassword == true,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        hintText: hint,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: suffixIcon ?? suffixVectorIcon,
        ),
        focusedBorder: focusBorder,
        border: border,
        focusColor: AppColors.current.primary,
      ),
    );
  }
}
