import 'package:bloc/bloc.dart';

import '../../../../../../core/bloc/bloc_event.dart';
import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../domain/models/register/user_register.dart';
import '../../../../domain/usecases/validate_register.dart';

part 'complete_profile_event.dart';

class CompleteProfileBloc extends Bloc<CompleteProfileEvent, BlocState> {
  final ValidateRegisterUseCase _validateRegisterUseCase;

  CompleteProfileBloc(this._validateRegisterUseCase) : super(Initialize()) {
    on<ValidateCompleteProfile>(onValidateCompleteProfile);
  }

  void onValidateCompleteProfile(
    ValidateCompleteProfile event,
    Emitter<BlocState> emit,
  ) async {
    final resultValidate =
        await _validateRegisterUseCase.call(params: event.userRegister);

    if (resultValidate.isEmpty) {
      emit(Success());
    } else {
      emit(Error(message: resultValidate));
    }
  }
}
