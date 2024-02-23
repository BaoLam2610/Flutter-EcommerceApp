import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../configs/di/injection_container.dart';
import 'bloc/login_cubit.dart';
import 'login_screen.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => inject.get<LoginCubit>(),
        ),
      ],
      child: const LoginScreen(),
    );
  }
}
