import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/usecases/validate/validate_email.dart';
import '../../features/app/bloc/global_app_cubit.dart';
import '../../features/auth/domain/usecases/validate_login.dart';
import '../../features/auth/presentation/screens/login/blocv2/login_cubit.dart';
import '../../features/intro/presentation/screens/bloc/intro_cubit.dart';
import '../../utils/api_list.dart';
import '../../utils/logger.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await provideSharePreferences();
  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    )..interceptors.addAll([
        LoggerInterceptor(),
      ]),
  );

  provideUseCase();
  provideBloc();
}

Future<void> provideSharePreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

void provideUseCase() {
  sl.registerLazySingleton(() => ValidateEmailUseCase());
  sl.registerLazySingleton(
    () => ValidateLoginUseCase(
      sl<ValidateEmailUseCase>(),
    ),
  );
}

void provideBloc() {
  sl.registerFactory(() => GlobalAppCubit());
  sl.registerFactory(() => IntroCubit());
  sl.registerFactory(
    () => LoginCubit(
      sl<ValidateLoginUseCase>(),
      sl<ValidateEmailUseCase>(),
    ),
  );
}
