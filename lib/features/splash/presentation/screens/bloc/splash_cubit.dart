import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../../app/domain/utils/app_storage.dart';
import '../../../domain/usecases/get_first_open_app.dart';
import '../../../domain/usecases/get_logged.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetFirstOpenAppUseCase _getFirstOpenAppUseCase =
      inject.get<GetFirstOpenAppUseCase>();

  final GetLoggedUseCase _getLoggedUseCase = inject.get<GetLoggedUseCase>();

  final AppStorage _appStorage = inject.get<AppStorage>();

  bool get isFirstOpenApp => state.isFirstOpenApp;

  SplashCubit() : super(SplashState(status: Initialize()));

  void init() async {
    final isFirstOpenApp = await _getFirstOpenAppUseCase.call();
    final isLogged = await _getLoggedUseCase.call();
    String nextRoute = '';

    if (isFirstOpenApp) {
      nextRoute = AppRoutes.introRoute;
    } else if (isLogged) {
      nextRoute = AppRoutes.mainRoute;
    } else {
      nextRoute = AppRoutes.loginRoute;
    }

    emit(state.copyWith(
      isFirstOpenApp: isFirstOpenApp,
      isLogged: isLogged,
      nextRoute: nextRoute,
    ));
  }

  void openNextScreenListener() {
    _onChangeLogoVisible();
    _onNextScreen();
  }

  void _onChangeLogoVisible() async {
    await Future.delayed(const Duration(milliseconds: 10));
    emit(state.copyWith(
      isLogoVisible: !state.isLogoVisible,
    ));
  }

  void _onNextScreen() async {
    await Future.delayed(AppDurations.delaySplash);
    emit(state.copyWith(
      status: Success(),
    ));
  }

  void fetchDataStorage() {
    _appStorage.init();
  }
}
