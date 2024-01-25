import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app/bloc/global_app_cubit.dart';
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

  provideGlobalAppCubit();
}

Future<void> provideSharePreferences() async {
 // sl.registerLazySingleton(() async {
 //   return await SharedPreferences.getInstance();
 // });
  sl.registerSingleton(await SharedPreferences.getInstance());
}

void provideGlobalAppCubit() {
  sl.registerFactory(() => GlobalAppCubit());
}
