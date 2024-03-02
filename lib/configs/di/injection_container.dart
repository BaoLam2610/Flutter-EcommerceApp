import 'package:get_it/get_it.dart';

import 'app_module.dart';
import 'bloc_module.dart';
import 'network_module.dart';
import 'repository_module.dart';
import 'usecase_module.dart';

final inject = GetIt.instance;

Future<void> initializeDependencies() async {
  await provideSharePreferences();
  provideRestApiClient();
  provideRepository();
  provideUseCase();
  provideBloc();
}
