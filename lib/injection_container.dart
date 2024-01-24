import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/usecases/validate/validate_email.dart';
import 'features/auth/domain/usecases/validate_login.dart';
import 'features/auth/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'features/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'features/auth/presentation/widgets/common/email_input/bloc/email_input_bloc.dart';
import 'utils/api_list.dart';
import 'utils/logger.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    )..interceptors.addAll([
        LoggerInterceptor(),
      ]),
  );

  // sl.registerSingleton(AuthService(sl()));
  // repository
  // sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));

  // use case
  sl.registerSingleton<ValidateEmailUseCase>(ValidateEmailUseCase());
  sl.registerSingleton<ValidateLoginUseCase>(ValidateLoginUseCase(sl()));
  // sl.registerSingleton(LoginUseCase(sl()));

  // bloc
  sl.registerFactory<EmailInputBloc>(() => EmailInputBloc(sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  sl.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc(sl()));
  // sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
  // sl.registerFactory<CompleteProfileBloc>(() => CompleteProfileBloc(sl()));
  // sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
}
