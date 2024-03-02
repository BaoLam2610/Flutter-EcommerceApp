import '../../features/app/domain/usecases/locale/get_device_locale.dart';
import '../../features/app/domain/usecases/locale/get_locale.dart';
import '../../features/app/domain/usecases/locale/save_locale.dart';
import '../../features/app/domain/usecases/validate/validate_email.dart';
import '../../features/app/domain/usecases/validate/validate_password.dart';
import '../../features/app/domain/usecases/validate/validate_password_confirm.dart';
import '../../features/app/domain/utils/app_storage.dart';
import '../../features/auth/domain/usecases/get_remember_account.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/register.dart';
import '../../features/auth/domain/usecases/save_access_token.dart';
import '../../features/auth/domain/usecases/save_logged.dart';
import '../../features/auth/domain/usecases/save_remember_account.dart';
import '../../features/intro/domain/usecases/save_first_open_app.dart';
import '../../features/splash/domain/usecases/get_first_open_app.dart';
import '../../features/splash/domain/usecases/get_logged.dart';
import '../configs.dart';

void provideUseCase() {
  inject.registerLazySingleton(() => SaveLocaleUseCase());
  inject.registerLazySingleton(() => GetDeviceLocaleUseCase());
  inject.registerLazySingleton(() => GetLocaleUseCase());

  inject.registerLazySingleton(() => SaveFirstOpenAppUseCase());
  inject.registerLazySingleton(() => GetFirstOpenAppUseCase());

  inject.registerLazySingleton(() => SaveLoggedUseCase());
  inject.registerLazySingleton(() => GetLoggedUseCase());

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
