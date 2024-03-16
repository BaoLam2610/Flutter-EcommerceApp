import '../../core/core.dart';
import '../../features/auth/data/remote/auth_service.dart';
import '../../features/category/data/remote/category_service.dart';
import '../../features/home/data/remote/home_service.dart';
import '../../utils/utils.dart';
import '../configs.dart';

void provideRestApiClient() {
  final RestApiClient apiClient = RestApiClient(
    baseUrl: EndPoint.baseUrl,
    interceptors: [LoggerInterceptor()],
  );
  inject.registerLazySingleton(() => apiClient);
  inject.registerLazySingleton(() => AuthService());
  inject.registerLazySingleton(() => HomeService());
  inject.registerLazySingleton(() => CategoryService());
}
