import '../../features/app/presentation/bloc/global_app_cubit.dart';
import '../../features/auth/presentation/screens/login/bloc/login_cubit.dart';
import '../../features/auth/presentation/screens/register/bloc/register_cubit.dart';
import '../../features/category/presentation/screens/bloc/category_cubit.dart';
import '../../features/home/presentation/screens/bloc/home_cubit.dart';
import '../../features/intro/presentation/screens/bloc/intro_cubit.dart';
import '../../features/main/presentation/bloc/main_cubit.dart';
import '../../features/profile/presentation/screens/bloc/profile_cubit.dart';
import '../../features/splash/presentation/screens/bloc/splash_cubit.dart';
import '../../features/store/presentation/screens/bloc/store_cubit.dart';
import '../configs.dart';

void provideBloc() {
  inject.registerLazySingleton(() => GlobalAppCubit());
  inject.registerLazySingleton(() => MainCubit());
  inject.registerFactory(() => SplashCubit());
  inject.registerFactory(() => IntroCubit());
  inject.registerFactory(() => LoginCubit());
  inject.registerFactory(() => RegisterCubit());
  inject.registerFactory(() => HomeCubit());
  inject.registerFactory(() => CategoryCubit());
  inject.registerFactory(() => StoreCubit());
  inject.registerFactory(() => ProfileCubit());
}
