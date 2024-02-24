import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../configs/di/injection_container.dart';
import '../../../../app/domain/usecases/first_open_app/get_first_open_app_usecase.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetFirstOpenAppUseCase _getFirstOpenAppUseCase =
      inject.get<GetFirstOpenAppUseCase>();

  SplashCubit() : super(SplashState());

  Future<bool> isFirstOpenApp() async {
    return await _getFirstOpenAppUseCase.call();
  }
}
