import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';
import 'bloc/password_input_cubit.dart';

enum PasswordInputType {
  /// For login screen
  single,

  /// For register/forgot password screen
  double,

  /// For change password screen
  triple,
}

class PasswordInputField extends StatefulWidget {
  final PasswordInputType type;

  const PasswordInputField({
    super.key,
    this.type = PasswordInputType.single,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  late PasswordInputCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ReadContext(context).read<PasswordInputCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return _buildInputField;
  }

  Widget get _buildInputField {
    switch (widget.type) {
      case PasswordInputType.single:
        return _singlePasswordInput;
      case PasswordInputType.double:
        return _doublePasswordInput;
      case PasswordInputType.triple:
        return _singlePasswordInput;
    }
  }

  Widget get _singlePasswordInput {
    return BlocBuilder<PasswordInputCubit, PasswordInputState>(
      buildWhen: (previous, current) =>
      previous.passwordError != current.passwordError ||
          previous.isShowPassword != current.isShowPassword,
      builder: (context, state) {
        return _PasswordField(
          controller: _cubit.textController,
          label: LocaleKeys.password.tr(),
          hint: LocaleKeys.password_hint.tr(),
          onChanged: (text) => _cubit.validatePassword(),
          onTapSuffix: _cubit.onChangeShowPassword,
          errorText: state.passwordError,
        );
      },
    );
  }

  Widget get _doublePasswordInput {
    return BlocBuilder<PasswordInputCubit, PasswordInputState>(
      buildWhen: (previous, current) =>
      previous.passwordError != current.passwordError ||
          previous.isShowPassword != current.isShowPassword,
      builder: (context, state) {
        return Column(
          children: [
            _PasswordField(
              controller: _cubit.textController,
              label: LocaleKeys.password.tr(),
              hint: LocaleKeys.password_hint.tr(),
              onChanged: (text) => _cubit.validatePassword(),
              onTapSuffix: _cubit.onChangeShowPassword,
              errorText: state.passwordError,
            ),
            _PasswordField(
              controller: _cubit.textController,
              label: LocaleKeys.password.tr(),
              hint: LocaleKeys.password_hint.tr(),
              onChanged: (text) => _cubit.validatePassword(),
              onTapSuffix: _cubit.onChangeShowPassword,
              errorText: state.passwordError,
            ),
          ],
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String errorText;
  final bool isShowPassword;
  final void Function(String text) onChanged;
  final VoidCallback onTapSuffix;

  const _PasswordField({
    super.key,
    this.isShowPassword = false,
    this.errorText = '',
    required this.controller,
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.onTapSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return LabelTextField(
      controller: controller,
      label: label,
      hint: hint,
      suffixIcon: _buildSuffixIcon,
      obscureText: !isShowPassword,
      errors: errorText,
      onChanged: onChanged,
    );
  }

  Widget get _buildSuffixIcon =>
      GestureDetector(
        onTap: onTapSuffix,
        child: isShowPassword
            ? Assets.icons.eyeOn.svg()
            : Assets.icons.eyeOff.svg(),
      );
}
