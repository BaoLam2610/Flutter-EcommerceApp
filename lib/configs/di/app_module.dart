import 'package:shared_preferences/shared_preferences.dart';

import '../configs.dart';

Future<void> provideSharePreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => sharedPreferences);
}
