part of 'injection_container.dart';

void provideBloc() {
  inject.registerFactory(() => GlobalAppCubit());
  inject.registerFactory(() => IntroCubit());
  inject.registerFactory(
    () => LoginCubit(
      inject<ValidateEmailUseCase>(),
      inject<ValidatePasswordUseCase>(),
      inject<LoginUseCase>(),
    ),
  );
}
