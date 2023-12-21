import 'package:bloc/bloc.dart';

import '../../../../../../../core/bloc/base_bloc.dart';
import '../../../../../../../core/bloc/bloc_state.dart';
import '../../../../../domain/models/login/user_login.dart';
import '../../../../../domain/usecases/login_usecase.dart';
import '../../../../../domain/usecases/validate_login.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<StatusState> {
  final ValidateLoginUseCase _validateLoginUseCase;
  final LoginUseCase _loginUseCase;

  LoginCubit(
    this._validateLoginUseCase,
    this._loginUseCase,
  ) : super(LoginState());

  void doLogin({
    required String email,
    required String password,
  }) async {
    final userLogin = UserLogin(email: email, password: password);
    final validateResult = await _validateLoginUseCase.call(params: userLogin);

    if (validateResult.isNotEmpty) {
      // state.copyWith();
      emit(state.copyWith(
        status: Status.error,
      ));
      // emit(state);
      return;
    }

    emit(state.copyWith(
      status: Status.loading,
    ));

    callApi(response: await _loginUseCase.call(params: userLogin));
  }
}
