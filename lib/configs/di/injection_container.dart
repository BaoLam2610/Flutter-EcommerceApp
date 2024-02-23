import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/api/api_list.dart';
import '../../core/resources/api/rest_api_client.dart';
import '../../features/app/domain/usecases/validate/validate_email.dart';
import '../../features/app/domain/usecases/validate/validate_password.dart';
import '../../features/app/presentation/bloc/global_app_cubit.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/screens/login/bloc/login_cubit.dart';
import '../../features/intro/presentation/screens/bloc/intro_cubit.dart';
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
