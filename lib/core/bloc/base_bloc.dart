import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_event.dart';
import 'bloc_state.dart';

class BaseBloc<Event extends BlocEvent, State extends Resource>
    extends Bloc<Event, State> {
  BaseBloc(super.initialState);
}

class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);
}
