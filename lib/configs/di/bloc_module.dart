part of 'injection_container.dart';

void provideBloc() {
  inject.registerLazySingleton(() => GlobalAppCubit());
  inject.registerLazySingleton(() => MainCubit());
  inject.registerFactory(() => SplashCubit());
  inject.registerFactory(() => IntroCubit());
  inject.registerFactory(() => LoginCubit());
  inject.registerFactory(() => RegisterCubit());
  inject.registerFactory(() => HomeCubit());
  inject.registerFactory(() => CategoryCubit());
  inject.registerFactory(() => StoreCubit());
  inject.registerFactory(() => ProfileCubit());
}
