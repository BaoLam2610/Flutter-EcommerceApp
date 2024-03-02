import '../../core/core.dart';
import '../../features/auth/data/remote/auth_service.dart';
import '../../utils/utils.dart';
import '../configs.dart';

void provideRestApiClient() {
  final RestApiClient apiClient = RestApiClient(
    baseUrl: ApiList.baseUrl,
    interceptors: [LoggerInterceptor()],
  );
  inject.registerLazySingleton(() => apiClient);
  inject.registerLazySingleton(() => AuthService());
}
