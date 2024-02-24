import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../configs/di/injection_container.dart';
import '../../../../../../core/bloc/base_bloc.dart';
import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../app/domain/usecases/validate/validate_email.dart';
import '../../../../../app/domain/usecases/validate/validate_password.dart';
import '../../../../../app/domain/usecases/validate/validate_password_confirm.dart';
import '../../../../data/dto/register_request.dart';
import '../../../../domain/entities/user_type.dart';
import '../../../../domain/usecases/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final ValidateEmailUseCase _validateEmailUseCase =
      inject.get<ValidateEmailUseCase>();

  final ValidatePasswordUseCase _validatePasswordUseCase =
      inject.get<ValidatePasswordUseCase>();

  final ValidatePasswordConfirmUseCase _validatePasswordConfirmUseCase =
      inject.get<ValidatePasswordConfirmUseCase>();

  final RegisterUseCase _registerUseCase = inject.get<RegisterUseCase>();

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

    emit(state.copyWith(status: Loading()));

    final result = await _registerUseCase.call(
      params: RegisterRequest(
        email: emailController.text,
        password: passwordController.text,
        userType: UserType.user,
      ),
    );

    callApiNoData(
      result,
      onSuccess: (successStatus) {
        emit(
          state.copyWith(status: successStatus),
        );
      },
      onError: (errorStatus) {
        emit(
          state.copyWith(status: errorStatus),
        );
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    return super.close();
  }
}
