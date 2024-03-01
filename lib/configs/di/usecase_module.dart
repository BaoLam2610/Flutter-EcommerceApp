part of 'injection_container.dart';

void provideUseCase() {
  inject.registerLazySingleton(() => SaveLocaleUseCase());
  inject.registerLazySingleton(() => GetDeviceLocaleUseCase());
  inject.registerLazySingleton(() => GetLocaleUseCase());
  inject.registerLazySingleton(() => SaveFirstOpenAppUseCase());
  inject.registerLazySingleton(() => GetFirstOpenAppUseCase());
  inject.registerLazySingleton(() => ValidateEmailUseCase());
  inject.registerLazySingleton(() => ValidatePasswordUseCase());
  inject.registerLazySingleton(() => ValidatePasswordConfirmUseCase());
  inject.registerLazySingleton(() => LoginUseCase());
  inject.registerLazySingleton(() => RegisterUseCase());
  inject.registerLazySingleton(() => SaveAccessTokenUseCase());
  inject.registerLazySingleton(() => SaveRememberAccountUseCase());
  inject.registerLazySingleton(() => GetRememberAccountUseCase());
  inject.registerLazySingleton(() => AppStorage());
}
