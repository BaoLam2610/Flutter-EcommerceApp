import 'package:bloc/bloc.dart';

import '../../../../../core/bloc/bloc_event.dart';
import '../../../../../core/bloc/bloc_state.dart';
import '../../../domain/usecases/get_home_data.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, BlocState> {
  final GetHomeDataUseCase _getHomeDataUseCase;

  HomeBloc(
    this._getHomeDataUseCase,
  ) : super(Initialize()) {
    on<GetHomeData>(_onGetHomeData);
  }

  void _onGetHomeData(GetHomeData event, Emitter<BlocState> emit) async {
    try {
      emit(Loading());
      await Future.delayed(const Duration(seconds: 5));
      final homeData = await _getHomeDataUseCase.call();
      emit(Success(data: homeData));
    } on Exception catch (e) {
      emit(
        Error(message: e.toString()),
      );
    }
  }
}
