import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app/bloc/global_app_cubit.dart';
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

  provideBloc();
}

Future<void> provideSharePreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
 sl.registerLazySingleton(() => sharedPreferences);
}

void provideBloc() {
  sl.registerLazySingleton(() => GlobalAppCubit());
  sl.registerLazySingleton(() => IntroCubit());
}
