import 'package:flutter/cupertino.dart';

import '../../../../../../configs/di/injection_container.dart';
import '../../../../../../core/bloc/base_bloc.dart';
import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../app/domain/usecases/validate/validate_email.dart';
import '../../../../../app/domain/usecases/validate/validate_password.dart';
import '../../../../../app/domain/utils/app_storage.dart';
import '../../../../data/dto/login_request.dart';
import '../../../../domain/entities/user_type.dart';
import '../../../../domain/usecases/login.dart';
import '../../../../domain/usecases/save_access_token.dart';
import '../../../../domain/usecases/save_logged.dart';
import '../../../../domain/usecases/save_remember_account.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _validateEmailUseCase = inject.get<ValidateEmailUseCase>();

  final _validatePasswordUseCase = inject.get<ValidatePasswordUseCase>();

  final _loginUseCase = inject.get<LoginUseCase>();

  final _saveAccessTokenUseCase = inject.get<SaveAccessTokenUseCase>();

  final _saveRememberAccountUseCase = inject.get<SaveRememberAccountUseCase>();

  final _saveLoggedUseCase = inject.get<SaveLoggedUseCase>();

  final _appStorage = inject.get<AppStorage>();

  LoginCubit() : super(LoginState(status: Initialize()));

  void init() async {
    emailController.text = _appStorage.account;
    passwordController.text = _appStorage.password;
    emit(state.copyWith(
      isRememberMe:
          _appStorage.account.isNotEmpty && _appStorage.password.isNotEmpty,
    ));
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

    emit(state.copyWith(status: Loading()));
    final resource = await _loginUseCase.call(
      params: LoginRequest(
        email: emailController.text,
        password: passwordController.text,
        userType: UserType.user,
      ),
    );

    if (resource is Success) {
      await _saveAccessTokenUseCase.call(params: resource.data?.accessToken);
      await _saveLoggedUseCase.call();
      await _saveRememberAccountUseCase.call(
        params: state.isRememberMe
            ? {
                AppKeys.email: emailController.text,
                AppKeys.password: passwordController.text,
              }
            : null,
      );
    }

    emit(state.copyWith(status: resource));
  }

  void onChangeRememberMe() {
    emit(state.copyWith(
      isRememberMe: !state.isRememberMe,
    ));
  }

  void clearInputData() {
    emailController.text = '';
    passwordController.text = '';
    emit(
      state.copyWith(
        emailError: '',
        passwordError: '',
        isRememberMe: false,
      ),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
