import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final void Function(String text)? onTextChanged;

  const EmailInputField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LabelTextField(
      controller: controller,
      label: label ?? LocaleKeys.email.tr(),
      hint: hint ?? LocaleKeys.email_hint.tr(),
      suffixIcon: Assets.icons.email.svg(),
      inputType: TextInputType.emailAddress,
      errors: errorText,
      onChanged: onTextChanged,
    );
  }
}
