import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/themes/color_themes.dart';
import '../../../../configs/themes/text_themes.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Icon? suffixIcon;
  final SvgPicture? suffixVectorIcon;
  final TextInputType? inputType;
  final bool readOnly;

  const SearchTextField({
    super.key,
    this.readOnly = true,
    this.controller,
    this.hint,
    this.suffixIcon,
    this.suffixVectorIcon,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(12),
    );

    return TextField(
      readOnly: readOnly,
      controller: controller,
      maxLines: 1,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        hintText: hint,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.search,
            color: textColorLightGrey,
          ),
        ),
        focusedBorder: border,
        enabledBorder: border,
        filled: true,
        fillColor: colorLightGrey,
      ),
    );
  }
}
