import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../../../core/resources/api/model/data_response.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/usecases/validate/validate_email.dart';
import '../../../../../../core/usecases/validate/validate_password.dart';
import '../../../../../../utils/logger.dart';
import '../../../../data/dto/login_request.dart';
import '../../../../domain/entities/user_type.dart';
import '../../../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final ValidateEmailUseCase _validateEmailUseCase;
  final ValidatePasswordUseCase _validatePasswordUseCase;
  final LoginUseCase _loginUseCase;

  LoginCubit(
    this._validateEmailUseCase,
    this._validatePasswordUseCase,
    this._loginUseCase,
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

    final result = await _loginUseCase.call(
      params: LoginRequest(
        email: emailController.text,
        password: passwordController.text,
        userType: UserType.user,
      ),
    );

    if (result is DataSuccess) {
      final dataResponse = DataResponse.fromJson(result.data as Map<String, dynamic>);
      Log.info('lamnb success : $dataResponse');
    } else if(result is DataError) {

      Log.info('lamnb error : ${result.error?.message}');
    }
  }
}
