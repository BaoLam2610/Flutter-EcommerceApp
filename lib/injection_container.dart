import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/usecases/validate/validate_email.dart';
import 'features/auth/domain/usecases/validate_login.dart';
import 'features/auth/domain/usecases/validate_register.dart';
import 'features/auth/presentation/pages/complete_profile/bloc/complete_profile_bloc.dart';
import 'features/auth/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'features/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'features/auth/presentation/pages/register/bloc/register_bloc.dart';
import 'features/home/data/repository/home_repository_impl.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/domain/usecases/get_home_data.dart';
import 'features/home/presentation/pages/bloc/home_bloc.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // repository
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl());

  // use case
  sl.registerSingleton<ValidateEmailUseCase>(ValidateEmailUseCase());
  sl.registerSingleton<ValidateLoginUseCase>(ValidateLoginUseCase(sl()));
  sl.registerSingleton<ValidateRegisterUseCase>(ValidateRegisterUseCase(sl()));

  sl.registerSingleton(GetHomeDataUseCase(sl()));

  // bloc
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  sl.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc(sl()));
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
  sl.registerFactory<CompleteProfileBloc>(() => CompleteProfileBloc(sl()));
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
}
