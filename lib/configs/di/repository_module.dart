part of 'injection_container.dart';

void provideRepository() {
  inject.registerLazySingleton<AppRepository>(() => AppRepositoryImpl());
  inject.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      inject.get<RestApiClient>(),
    ),
  );
}
