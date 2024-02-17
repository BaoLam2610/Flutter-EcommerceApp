import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/widgets.dart';
import '../../../../../../gen/locale_keys.g.dart';
import '../bloc/login_cubit.dart';

class RememberCheckbox extends StatelessWidget {
  final LoginCubit _loginCubit;

  const RememberCheckbox(this._loginCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: _loginCubit,
      buildWhen: (previous, current) =>
          previous.isRememberMe != current.isRememberMe,
      builder: (context, state) => LabelCheckbox(
        label: LocaleKeys.remember_me.tr(),
        isChecked: state.isRememberMe,
        onChanged: (isChecked) => _loginCubit.onChangeRememberMe(),
      ),
    );
  }
}
