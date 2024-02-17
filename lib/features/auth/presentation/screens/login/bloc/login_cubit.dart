import 'package:equatable/equatable.dart';

import '../../../../../../configs/di/injection_container.dart';
import '../../../../../../core/bloc/base_bloc.dart';
import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../data/dto/login_request.dart';
import '../../../../domain/entities/login_info_entity.dart';
import '../../../../domain/entities/user_type.dart';
import '../../../../domain/usecases/login_usecase.dart';
import '../../../widgets/email_input/bloc/email_input_cubit.dart';
import '../../../widgets/password_input/bloc/password_input_cubit.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final LoginUseCase _loginUseCase = inject.get<LoginUseCase>();
  final EmailInputCubit _emailInputCubit = inject.get<EmailInputCubit>();
  final PasswordInputCubit _passwordInputCubit =
      inject.get<PasswordInputCubit>();

  LoginCubit() : super(LoginState(status: Initialize()));

  Future<bool> _validForm() async {
    final validEmail = await _emailInputCubit.validateEmail();
    final validPassword = await _passwordInputCubit.validatePassword();
    return validEmail && validPassword;
  }

  void doLogin() async {
    if (!await _validForm()) {
      return;
    }

    emit(state.copyWith(status: Loading()));

    final result = await _loginUseCase.call(
      params: LoginRequest(
        email: _emailInputCubit.textController.text,
        password: _passwordInputCubit.textController.text,
        userType: UserType.user,
      ),
    );

    callApi<LoginInfoEntity>(
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

  void onChangeRememberMe() {
    emit(state.copyWith(
      isRememberMe: !state.isRememberMe,
    ));
  }
}
