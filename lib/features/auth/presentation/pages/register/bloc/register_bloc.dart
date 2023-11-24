import 'package:bloc/bloc.dart';

import '../../../../../../core/bloc/bloc_event.dart';
import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../domain/models/register/user_register.dart';
import '../../../../domain/usecases/validate_register.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, BlocState> {
  final ValidateRegisterUseCase _validateRegisterUseCase;

  RegisterBloc(this._validateRegisterUseCase) : super(Initialize()) {
    on<ValidateRegister>(onValidateRegister);
  }

  void onValidateRegister(
    ValidateRegister event,
    Emitter<BlocState> emit,
  ) async {
    final resultValidate =
        await _validateRegisterUseCase.call(params: event.userRegister);

    if (resultValidate.isEmpty) {
      emit(Success(data: event.userRegister));
    } else {
      emit(Error(message: resultValidate));
    }
  }
}
