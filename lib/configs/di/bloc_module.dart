part of 'injection_container.dart';

void provideBloc() {
  inject.registerLazySingleton(() => GlobalAppCubit());
  inject.registerFactory(() => SplashCubit());
  inject.registerFactory(() => IntroCubit());
  inject.registerFactory(() => LoginCubit());
  inject.registerFactory(() => RegisterCubit());
}
