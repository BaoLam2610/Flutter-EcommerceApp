import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/api/rest_api_client.dart';
import '../../core/resources/api_list.dart';
import '../../core/usecases/validate/validate_email.dart';
import '../../core/usecases/validate/validate_password.dart';
import '../../features/app/bloc/global_app_cubit.dart';
import '../../features/auth/presentation/screens/login/bloc/login_cubit.dart';
import '../../features/intro/presentation/screens/bloc/intro_cubit.dart';
import '../../utils/logger.dart';

part 'network_module.dart';
part 'bloc_module.dart';
part 'usecase_module.dart';
part 'app_module.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await provideSharePreferences();
  provideRestApiClient();
  provideUseCase();
  provideBloc();
}