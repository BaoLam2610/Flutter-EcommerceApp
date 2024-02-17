part of 'injection_container.dart';

void provideRestApiClient() {
  final RestApiClient apiClient = RestApiClient(
    baseUrl: ApiList.baseUrl,
    interceptors: [LoggerInterceptor()],
  );
  inject.registerLazySingleton(() => apiClient);
}
