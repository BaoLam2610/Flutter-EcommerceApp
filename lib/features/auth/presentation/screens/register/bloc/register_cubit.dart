import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../configs/di/injection_container.dart';
import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../app/domain/usecases/validate/validate_email.dart';
import '../../../../../app/domain/usecases/validate/validate_password.dart';
import '../../../../../app/domain/usecases/validate/validate_password_confirm.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final ValidateEmailUseCase _validateEmailUseCase =
      inject.get<ValidateEmailUseCase>();

  final ValidatePasswordUseCase _validatePasswordUseCase =
      inject.get<ValidatePasswordUseCase>();

  final ValidatePasswordConfirmUseCase _validatePasswordConfirmUseCase =
      inject.get<ValidatePasswordConfirmUseCase>();

  RegisterCubit() : super(RegisterState(status: Initialize()));

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
      passwordConfirmError: '',
    ));

    return validateResult.isEmpty;
  }

  Future<bool> validatePasswordConfirm({bool isClick = false}) async {
    final validateResult = await _validatePasswordConfirmUseCase.call(params: {
      AppKeys.password: passwordController.text,
      AppKeys.passwordConfirm: passwordConfirmController.text,
      AppKeys.clickAction: isClick,
    });

    emit(state.copyWith(
      passwordConfirmError: validateResult,
    ));

    return validateResult.isEmpty;
  }

  Future<bool> _validForm() async {
    final validEmail = await validateEmail();
    final validPassword = await validatePassword();
    final validPasswordConfirm = await validatePasswordConfirm(isClick: true);
    return validEmail && validPassword && validPasswordConfirm;
  }

  void doRegister() async {
    if (!await _validForm()) {
      return;
    }
  }
}
