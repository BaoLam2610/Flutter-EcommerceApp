import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/domain/usecases/validate_login.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

// use case
  sl.registerSingleton<ValidateLoginUseCase>(ValidateLoginUseCase());

  // bloc
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
}
