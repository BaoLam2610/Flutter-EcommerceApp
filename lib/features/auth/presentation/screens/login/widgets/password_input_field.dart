import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/widgets.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/locale_keys.g.dart';
import '../bloc/login_cubit.dart';

class PasswordInputField extends StatelessWidget {
  final LoginCubit _loginCubit;

  const PasswordInputField(this._loginCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: _loginCubit,
      buildWhen: (previous, current) =>
          previous.passwordError != current.passwordError ||
          previous.isShowPassword != current.isShowPassword,
      builder: (context, state) {
        return LabelTextField(
          controller: _loginCubit.passwordController,
          label: LocaleKeys.password.tr(),
          hint: LocaleKeys.password_hint.tr(),
          suffixIcon: _buildSuffixIcon(state.isShowPassword),
          obscureText: state.isShowPassword,
          errors: state.passwordError,
          onChanged: (text) => _loginCubit.validatePassword(),
        );
      },
    );
  }

  Widget _buildSuffixIcon(bool isShowPassword) => GestureDetector(
        onTap: _loginCubit.onChangeShowPassword,
        child: isShowPassword
            ? Assets.icons.eyeOn.svg()
            : Assets.icons.eyeOff.svg(),
      );
}
