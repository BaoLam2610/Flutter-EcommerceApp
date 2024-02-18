import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../configs/di/injection_container.dart';
import '../../../../../app/domain/usecases/validate/validate_password.dart';

part 'password_input_state.dart';

class PasswordInputCubit extends Cubit<PasswordInputState> {
  final textController = TextEditingController();
  final ValidatePasswordUseCase _validatePasswordUseCase =
      inject.get<ValidatePasswordUseCase>();

  PasswordInputCubit() : super(const PasswordInputState());

  void onChangeShowPassword() {
    emit(
      state.copyWith(
        isShowPassword: !state.isShowPassword,
      ),
    );
  }

  Future<bool> validatePassword() async {
    final validateResult =
        await _validatePasswordUseCase.call(params: textController.text);

    emit(state.copyWith(
      passwordError: validateResult,
    ));

    return validateResult.isEmpty;
  }

  @override
  Future<void> close() {
    textController.dispose();
    return super.close();
  }
}
