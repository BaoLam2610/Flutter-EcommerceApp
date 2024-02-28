import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool isShowPassword;
  final void Function(String text)? onTextChanged;

  const PasswordInputField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.isShowPassword = false,
    this.onTextChanged,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  late bool _isShowPassword;

  @override
  void initState() {
    super.initState();
    _isShowPassword = widget.isShowPassword;
  }

  @override
  Widget build(BuildContext context) {
    return LabelTextField(
      controller: widget.controller,
      label: widget.label ?? LocaleKeys.password.tr(),
      hint: widget.hint ?? LocaleKeys.password_hint.tr(),
      suffixIcon: _buildSuffixIcon,
      obscureText: !_isShowPassword,
      errors: widget.errorText,
      onChanged: widget.onTextChanged,
    );
  }

  Widget get _buildSuffixIcon => GestureDetector(
        onTap: () => setState(() => _isShowPassword = !_isShowPassword),
        child: _isShowPassword
            ? Assets.icons.eyeOn.svg()
            : Assets.icons.eyeOff.svg(),
      );
}
