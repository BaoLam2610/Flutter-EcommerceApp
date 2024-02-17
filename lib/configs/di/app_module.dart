part of 'injection_container.dart';

Future<void> provideSharePreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => sharedPreferences);
}
