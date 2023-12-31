import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../../../core/usecases/validate/validate_email.dart';

part 'forgot_password_event.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, BlocState> {
  final ValidateEmailUseCase _validateEmailUseCase;

  ForgotPasswordBloc(this._validateEmailUseCase) : super(Initialize()) {
    on<ValidateEmail>(onValidateEmail);
  }

  void onValidateEmail(ValidateEmail event, Emitter<BlocState> emit) async {
    final resultValidate = await _validateEmailUseCase.call(params: event.email);

    if (resultValidate.isEmpty) {
      emit(Success());
    } else {
      emit(Error(message: resultValidate));
    }
  }
}
