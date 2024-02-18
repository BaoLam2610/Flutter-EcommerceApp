import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/di/injection_container.dart';
import '../../../configs/routes/routes.dart';
import '../../../configs/themes/themes.dart';
import '../../../core/constants/constants.dart';
import '../../../gen/codegen_loader.g.dart';
import '../../splash/presentation/screens/splash_screen.dart';
import 'bloc/global_app_cubit.dart';

class BLMarketApp extends StatefulWidget {
  const BLMarketApp({super.key});

  @override
  State<BLMarketApp> createState() => _BLMarketAppState();
}

class _BLMarketAppState extends State<BLMarketApp> {
  late GlobalAppCubit _globalAppCubit;

  @override
  void initState() {
    super.initState();
    _globalAppCubit = inject.get<GlobalAppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return _easyLocalizationContainer;
  }

  Widget get _easyLocalizationContainer => EasyLocalization(
        path: AppLocalizations.path,
        fallbackLocale: AppLocalizations.fallBackLocale,
        supportedLocales: AppLocalizations.supportedLocales,
        assetLoader: const CodegenLoader(),
        child: _screenUtilContainer,
      );

  Widget get _screenUtilContainer => ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => _appContainer,
      );

  Widget get _appContainer => BlocBuilder<GlobalAppCubit, GlobalAppState>(
        bloc: _globalAppCubit,
        builder: (context, state) => MaterialApp(
          navigatorKey: AppKeys.navigatorKey,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: lightTheme,
          // darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          themeMode: state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routes: AppRoutes.routes,
          initialRoute: SplashScreen.route,
        ),
      );
}
