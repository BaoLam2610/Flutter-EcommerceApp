import 'package:bloc/bloc.dart';

import '../../../../../../../core/usecases/validate/validate_email.dart';

part 'email_input_event.dart';

part 'email_input_state.dart';

class EmailInputBloc extends Bloc<EmailInputEvent, EmailInputState> {
  final ValidateEmailUseCase _validateEmailUseCase;

  EmailInputBloc(this._validateEmailUseCase) : super(EmailInputInitial()) {
    on<EmailInputEvent>(validateEmail);

  }

  void validateEmail(
    EmailInputEvent event,
    Emitter<EmailInputState> emit,
  ) async {
    final email = event.email;
    final result = await _validateEmailUseCase.call(params: email);
    if (result.isNotEmpty) {
      emit(EmailNotValid(message: result));
    } else {
      emit(EmailValid());
    }
  }
}
