import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/data_state.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class BaseBloc<Event extends BlocEvent, State extends BlocState>
    extends Bloc<Event, State> {
  BaseBloc(super.initialState);
}

class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  void callApi(
    DataState result, {
    void Function(dynamic data)? onSuccess,
    void Function(String error)? onError,
  }) {
    if (result is DataSuccess) {
      onSuccess?.call(result.data);
    } else if (result is DataError) {
      onError?.call(result.exception.toString());
    }
  }
}
