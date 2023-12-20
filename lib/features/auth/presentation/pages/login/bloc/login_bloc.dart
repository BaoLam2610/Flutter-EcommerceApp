import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/bloc/bloc_event.dart';
import '../../../../../../core/bloc/bloc_state.dart';
import '../../../../../../core/resources/api/data_response.dart';
import '../../../../domain/models/login/user_login.dart';
import '../../../../domain/usecases/login_usecase.dart';
import '../../../../domain/usecases/validate_login.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, BlocState> {
  final ValidateLoginUseCase _validateLoginUseCase;
  final LoginUseCase _loginUseCase;

  LoginBloc(
    this._validateLoginUseCase,
    this._loginUseCase,
  ) : super(Initialize()) {
    on<ValidateLogin>(onValidateLogin);
  }

  void onValidateLogin(
    ValidateLogin event,
    Emitter<BlocState> emit,
  ) async {
    try {
      final validateResult =
      await _validateLoginUseCase.call(params: event.userLogin);

      if (validateResult.isEmpty) {
        emit(Loading());
        final userLogin = event.userLogin!;
        final response = await _loginUseCase.call(params: {
          'email': userLogin.email,
          'password': userLogin.password,
        });
        if (response.isSuccess) {
          emit(Success(data: response.data));
        } else {
          emit(Error(message: response.error??''));
        }
      } else {
        emit(
          Error(message: validateResult),
        );
      }
    } on DioException catch(e) {
      if(e.response?.data != null) {
        final json = e.response?.data as Map<String, dynamic>;

        final response = BaseResponse.fromJson(json);
        dynamic messageError;
        if(response.error is String) {
          messageError = response.error;
        }
        if(response.error is List<dynamic>) {
          messageError = response.error.map((e) => e.toString()).toList();
        }
        emit(Error(message: messageError.toString()));
      }
    }
    on Exception catch(e) {
      print('lamnb: $e');
      emit(Error(message: e.toString()));
    }
  }

  void doLogin(
    UserLogin userLogin,
    Emitter<BlocState> emit,
  ) async {
    try {
      final response = await _loginUseCase.call(params: {
        'email': userLogin.email,
        'password': userLogin.password,
      });
      if(response.isSuccess) {
        emit(Success(data: response.data));
      } else {
        emit(Error(message: response.error??''));
      }

    } on Exception catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
