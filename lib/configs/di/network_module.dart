part of 'injection_container.dart';

void provideRestApiClient() {
  final RestApiClient apiClient = RestApiClient(
    baseUrl: ApiList.baseUrl,
    interceptors: [LoggerInterceptor()],
  );
  sl.registerLazySingleton(() => apiClient);
}
