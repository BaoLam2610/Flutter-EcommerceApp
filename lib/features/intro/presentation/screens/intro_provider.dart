import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/configs.dart';
import 'bloc/intro_cubit.dart';
import 'intro_screen.dart';

class IntroProvider extends StatelessWidget {
  const IntroProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IntroCubit>(
      create: (context) => inject.get<IntroCubit>(),
      child: const IntroScreen(),
    );
  }
}
