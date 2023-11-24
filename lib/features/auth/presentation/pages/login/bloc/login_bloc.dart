import 'package:bloc/bloc.dart';

import '../../../../../../core/bloc/bloc_event.dart';
import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../domain/models/login/user_login.dart';
import '../../../../domain/usecases/validate_login.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, BlocState> {
  final ValidateLoginUseCase _validateLoginUseCase;

  LoginBloc(this._validateLoginUseCase) : super(Initialize()) {
    on<ValidateLogin>(onValidateLogin);
  }

  void onValidateLogin(
    ValidateLogin event,
    Emitter<BlocState> emit,
  ) async {
    final validateResult =
        await _validateLoginUseCase.call(params: event.userLogin);

    if (validateResult.isEmpty) {
      emit(Success());
    } else {
      emit(
        Error(message: validateResult),
      );
    }
  }
}
