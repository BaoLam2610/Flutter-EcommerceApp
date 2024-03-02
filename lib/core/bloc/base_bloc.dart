import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';

class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);
}
