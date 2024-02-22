import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/bloc/bloc_state.dart';
import '../../../widgets/email_input/bloc/email_input_cubit.dart';
import '../../../widgets/password_input/bloc/password_input_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  late EmailInputCubit _emailInputCubit;
  late PasswordInputCubit _passwordInputCubit;

  RegisterCubit() : super(RegisterState(status: Initialize()));

  void init(BuildContext context) {
    _emailInputCubit = ReadContext(context).read<EmailInputCubit>();
    _passwordInputCubit = ReadContext(context).read<PasswordInputCubit>();
  }

  Future<bool> _validForm() async {
    final validEmail = await _emailInputCubit.validateEmail();
    final validPassword = await _passwordInputCubit.validatePassword();
    return validEmail && validPassword;
  }
}
