import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/api/model/data_response.dart';
import '../resources/data_state.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class BaseBloc<Event extends BlocEvent, State extends BlocState>
    extends Bloc<Event, State> {
  BaseBloc(super.initialState);
}

class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  void callApi<T>(
    DataState result, {
    void Function(Success<T> successStatus)? onSuccess,
    void Function(Error errorStatus)? onError,
  }) {
    if (result is DataSuccess<T>) {
      onSuccess?.call(
        Success(
          data: result.data,
          message: result.message,
        ),
      );
    } else if (result is DataError) {
      onError?.call(
        Error(
          message: result.exception.toString(),
        ),
      );
    }
  }

  void callApiNoData(
    DataState result, {
    void Function(Success<dynamic> successStatus)? onSuccess,
    void Function(Error errorStatus)? onError,
  }) {
    callApi<NoData>(result, onSuccess: onSuccess, onError: onError);
  }
}
