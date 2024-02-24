import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/api/api_list.dart';
import '../../core/resources/api/rest_api_client.dart';
import '../../features/app/domain/usecases/validate/validate_email.dart';
import '../../features/app/domain/usecases/validate/validate_password.dart';
import '../../features/app/domain/usecases/validate/validate_password_confirm.dart';
import '../../features/app/presentation/bloc/global_app_cubit.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecases/get_remember_account_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/save_access_token_usecase.dart';
import '../../features/auth/domain/usecases/save_remember_account_usecase.dart';
import '../../features/auth/presentation/screens/login/bloc/login_cubit.dart';
import '../../features/auth/presentation/screens/register/bloc/register_cubit.dart';
import '../../features/app/data/repository/app_repository_impl.dart';
import '../../features/app/domain/repository/app_repository.dart';
import '../../features/app/domain/usecases/first_open_app/get_first_open_app_usecase.dart';
import '../../features/app/domain/usecases/first_open_app/save_first_open_app_usecase.dart';
import '../../features/intro/presentation/screens/bloc/intro_cubit.dart';
import '../../features/splash/presentation/screens/bloc/splash_cubit.dart';
import '../../utils/logger.dart';

part 'app_module.dart';

part 'bloc_module.dart';

part 'network_module.dart';

part 'repository_module.dart';

part 'usecase_module.dart';

final inject = GetIt.instance;

Future<void> initializeDependencies() async {
  await provideSharePreferences();
  provideRestApiClient();
  provideRepository();
  provideUseCase();
  provideBloc();
}
