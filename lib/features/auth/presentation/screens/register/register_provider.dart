import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../configs/di/injection_container.dart';
import '../../widgets/email_input/bloc/email_input_cubit.dart';
import '../../widgets/password_input/bloc/password_input_cubit.dart';
import 'bloc/register_cubit.dart';
import 'register_screen.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (context) => inject.get<RegisterCubit>(),
        ),
        BlocProvider<EmailInputCubit>(
          create: (context) => inject.get<EmailInputCubit>(),
        ),
        BlocProvider<PasswordInputCubit>(
          create: (context) => inject.get<PasswordInputCubit>(),
        ),
      ],
      child: const RegisterScreen(),
    );
  }
}
