import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/routes/routes.dart';
import 'configs/themes/app_themes.dart';
import 'features/auth/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'features/auth/presentation/pages/login/login_page.dart';
import 'injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ForgotPasswordBloc>()),
        // BlocProvider(create: (context) => sl<RegisterBloc>()),
        // BlocProvider(create: (context) => sl<CompleteProfileBloc>()),
        // BlocProvider(create: (context) => sl<HomeBloc>()),
      ],
      child: MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const LoginProvider(),
      ),
    );
  }
}
