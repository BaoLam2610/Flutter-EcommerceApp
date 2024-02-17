import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../configs/di/injection_container.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';
import 'bloc/password_input_cubit.dart';

class PasswordInputField extends StatelessWidget {
  final PasswordInputCubit _cubit = inject.get<PasswordInputCubit>();

  PasswordInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordInputCubit, PasswordInputState>(
      bloc: _cubit,
      buildWhen: (previous, current) =>
          previous.passwordError != current.passwordError ||
          previous.isShowPassword != current.isShowPassword,
      builder: (context, state) {
        return LabelTextField(
          controller: _cubit.textController,
          label: LocaleKeys.password.tr(),
          hint: LocaleKeys.password_hint.tr(),
          suffixIcon: _buildSuffixIcon(state.isShowPassword),
          obscureText: !state.isShowPassword,
          errors: state.passwordError,
          onChanged: (text) => _cubit.validatePassword(),
        );
      },
    );
  }

  Widget _buildSuffixIcon(bool isShowPassword) => GestureDetector(
        onTap: _cubit.onChangeShowPassword,
        child: isShowPassword
            ? Assets.icons.eyeOn.svg()
            : Assets.icons.eyeOff.svg(),
      );
}
