import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../../../core/usecases/validate/validate_email.dart';
import '../../../../../../core/usecases/validate/validate_password.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final ValidateEmailUseCase _validateEmailUseCase;
  final ValidatePasswordUseCase _validatePasswordUseCase;

  LoginCubit(
    this._validateEmailUseCase,
    this._validatePasswordUseCase,
  ) : super(LoginState(status: Initialize()));

  void onChangeShowPassword() {
    emit(
      state.copyWith(
        isShowPassword: !state.isShowPassword,
      ),
    );
  }

  Future<bool> validateEmail() async {
    final validateResult =
        await _validateEmailUseCase.call(params: emailController.text);

    emit(state.copyWith(
      emailError: validateResult,
    ));

    return validateResult.isEmpty;
  }

  Future<bool> validatePassword() async {
    final validateResult =
        await _validatePasswordUseCase.call(params: passwordController.text);

    emit(state.copyWith(
      passwordError: validateResult,
    ));

    return validateResult.isEmpty;
  }

  Future<bool> _validForm() async {
    final validEmail = await validateEmail();
    final validPassword = await validatePassword();
    return validEmail && validPassword;
  }

  void doLogin() async {
    if (!await _validForm()) {
      return;
    }
  }
}
