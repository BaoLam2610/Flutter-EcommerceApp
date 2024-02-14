import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../../../core/usecases/validate/validate_email.dart';
import '../../../../domain/usecases/validate_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final ValidateLoginUseCase _validateLoginUseCase;
  final ValidateEmailUseCase _validateEmailUseCase;

  LoginCubit(
    this._validateLoginUseCase,
    this._validateEmailUseCase,
  ) : super(LoginState(status: Initialize()));

  Future<bool> validateEmail() async {
    final validateResult =
        await _validateEmailUseCase.call(params: emailController.text);

    if (validateResult.isNotEmpty) {
      emit(state.copyWith(
        emailError: validateResult,
      ));
      return false;
    }

    return true;
  }

  void validateLogin() async {
    if (!await validateEmail()) {
      return;
    }
    doLogin();
  }

  void doLogin() {}
}
