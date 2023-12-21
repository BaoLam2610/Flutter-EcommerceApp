import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logger.dart';
import '../resources/api/data_response.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class BaseBloc<Event extends BlocEvent, State extends BlocState>
    extends Bloc<Event, State> {
  BaseBloc(super.initialState);
}

class BaseCubit<S extends StatusState> extends Cubit<StatusState> {
  BaseCubit(super.initialState);

  void callApi<T>({
    required DataResponse<T> response,
    Function(T data)? onSuccess,
    Function(String message)? onError,
  }) {
    try {
      if (response.isSuccess) {
        emit(
          state.copyWith(
            status: Status.success,
            data: response.data,
          ),
        );
      } else {}
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        // onError('Connection timeout! Retry again!');
        emit(
          state.copyWith(
            status: Status.error,
            data: null,
            message: 'Connection timeout! Retry again!',
          ),
        );
        return;
      }
      if (e.response?.data != null) {
        final json = e.response?.data as Map<String, dynamic>;

        final response = BaseResponse.fromJson(json);
        dynamic messageError;
        if (response.error is String) {
          messageError = response.error;
        }
        if (response.error is List<dynamic>) {
          messageError = response.error.map((e) => e.toString()).toList();
        }
        emit(
          state.copyWith(
            status: Status.error,
            data: null,
            message: messageError.toString(),
          ),
        );
      }
    } on Exception catch (e) {
      Log.debug('$e');
      emit(
        state.copyWith(
          status: Status.error,
          data: null,
          message: e.toString(),
        ),
      );
    }
  }
}
