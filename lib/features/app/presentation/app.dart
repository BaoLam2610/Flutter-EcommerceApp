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
import 'bloc/global_app_cubit.dart';

class BLMarketApp extends StatelessWidget {
  const BLMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _easyLocalizationContainer(context);
  }

  Widget _easyLocalizationContainer(BuildContext context) => EasyLocalization(
        path: AppLocalizations.path,
        fallbackLocale: AppLocalizations.fallBackLocale,
        supportedLocales: AppLocalizations.supportedLocales,
        assetLoader: const CodegenLoader(),
        child: _screenUtilContainer(context),
      );

  Widget _screenUtilContainer(BuildContext context) => ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => _appContainer(context),
      );

  Widget _appContainer(BuildContext context) =>
      BlocBuilder<GlobalAppCubit, GlobalAppState>(
        bloc: inject.get<GlobalAppCubit>()
          ..initLocale(contextSetLocale: context.setLocale),
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
          initialRoute: AppRoutes.splashRoute,
        ),
      );
}
