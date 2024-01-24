import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'configs/routes/routes.dart';
import 'configs/themes/app_themes.dart';
import 'features/auth/presentation/screens/intro/intro_screen.dart';
import 'gen/codegen_loader.g.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path: 'assets/strings',
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const IntroScreen(),
      ),
    );
  }
}
