import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../configs/di/injection_container.dart';
import '../../../../../app/domain/usecases/validate/validate_email.dart';

part 'email_input_state.dart';

class EmailInputCubit extends Cubit<EmailInputState> {
  final textController = TextEditingController();
  final ValidateEmailUseCase _validateEmailUseCase =
      inject.get<ValidateEmailUseCase>();

  EmailInputCubit() : super(const EmailInputState());

  Future<bool> validateEmail() async {
    final validateResult =
        await _validateEmailUseCase.call(params: textController.text);

    emit(state.copyWith(
      emailError: validateResult,
    ));

    return validateResult.isEmpty;
  }

  @override
  Future<void> close() {
    textController.dispose();
    return super.close();
  }
}
