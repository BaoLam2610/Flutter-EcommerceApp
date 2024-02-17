part of 'injection_container.dart';

void provideBloc() {
  inject.registerFactory(() => GlobalAppCubit());
  inject.registerFactory(() => IntroCubit());
  inject.registerLazySingleton(() => EmailInputCubit());
  inject.registerLazySingleton(() => PasswordInputCubit());
  inject.registerFactory(() => LoginCubit());
}
