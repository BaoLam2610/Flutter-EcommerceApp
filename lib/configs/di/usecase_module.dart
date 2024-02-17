part of 'injection_container.dart';

void provideUseCase() {
  inject.registerLazySingleton(() => ValidateEmailUseCase());
  inject.registerLazySingleton(() => ValidatePasswordUseCase());
  inject.registerLazySingleton(() => LoginUseCase(inject.get<AuthRepository>()));
}
