import '../../../../../core/bloc/base_bloc.dart';
import '../../../../../core/bloc/bloc_state.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeState(status: Initialize()));
}
