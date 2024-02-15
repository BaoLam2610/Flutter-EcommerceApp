part of 'injection_container.dart';

void provideUseCase() {
  sl.registerLazySingleton(() => ValidateEmailUseCase());
  sl.registerLazySingleton(() => ValidatePasswordUseCase());
}