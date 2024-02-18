import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../configs/di/injection_container.dart';
import '../../widgets/email_input/bloc/email_input_cubit.dart';
import '../../widgets/password_input/bloc/password_input_cubit.dart';
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
        BlocProvider<EmailInputCubit>(
          create: (context) => inject.get<EmailInputCubit>(),
        ),
        BlocProvider<PasswordInputCubit>(
          create: (context) => inject.get<PasswordInputCubit>(),
        ),
      ],
      child: const LoginScreen(),
    );
  }
}
