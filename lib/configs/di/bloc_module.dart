part of 'injection_container.dart';

void provideBloc() {
  sl.registerFactory(() => GlobalAppCubit());
  sl.registerFactory(() => IntroCubit());
  sl.registerFactory(
    () => LoginCubit(
      sl<ValidateEmailUseCase>(),
      sl<ValidatePasswordUseCase>(),
    ),
  );
}
