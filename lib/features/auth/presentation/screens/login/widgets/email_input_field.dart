import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/locale_keys.g.dart';
import '../../../widgets/label_text_field.dart';
import '../bloc/login_cubit.dart';

class EmailInputField extends StatelessWidget {
  final LoginCubit _loginCubit;

  const EmailInputField(this._loginCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: _loginCubit,
      buildWhen: (previous, current) =>
          previous.emailError != current.emailError,
      builder: (context, state) {
        return LabelTextField(
          controller: _loginCubit.emailController,
          label: LocaleKeys.email.tr(),
          hint: LocaleKeys.email_hint.tr(),
          suffixIcon: Assets.icons.email.svg(),
          inputType: TextInputType.emailAddress,
          errors: state.emailError,
          onChanged: (text) => _loginCubit.validateEmail(),
        );
      },
    );
  }
}
