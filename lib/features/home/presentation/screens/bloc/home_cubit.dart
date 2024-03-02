import '../../../../../core/core.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeState(status: Initialize()));
}
