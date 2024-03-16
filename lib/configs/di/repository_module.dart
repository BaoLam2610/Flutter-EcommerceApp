import '../../features/app/data/repository/app_repository_impl.dart';
import '../../features/app/domain/repository/app_repository.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/category/data/repository/category_repository_impl.dart';
import '../../features/category/domain/repository/category_repository.dart';
import '../../features/home/data/repository/home_repository_impl.dart';
import '../../features/home/domain/repository/home_repository.dart';
import '../configs.dart';

void provideRepository() {
  inject.registerLazySingleton<AppRepository>(() => AppRepositoryImpl());
  inject.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  inject.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  inject.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl());
}
