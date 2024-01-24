import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'utils/api_list.dart';
import 'utils/logger.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
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
}
