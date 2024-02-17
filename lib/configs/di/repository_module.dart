part of 'injection_container.dart';

void provideRepository() {
  inject.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      inject.get<RestApiClient>(),
    ),
  );
}
