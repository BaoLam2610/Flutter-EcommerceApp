import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/routes/routes.dart';
import 'configs/themes/app_themes.dart';
import 'features/auth/presentation/pages/complete_profile/bloc/complete_profile_bloc.dart';
import 'features/auth/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'features/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'features/auth/presentation/pages/register/bloc/register_bloc.dart';
import 'features/home/presentation/pages/bloc/home_bloc.dart';
import 'features/home/presentation/pages/home_page.dart';
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
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => sl<ForgotPasswordBloc>()),
        BlocProvider(create: (context) => sl<RegisterBloc>()),
        BlocProvider(create: (context) => sl<CompleteProfileBloc>()),
        BlocProvider(create: (context) => sl<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const HomePage(),
      ),
    );
  }
}
