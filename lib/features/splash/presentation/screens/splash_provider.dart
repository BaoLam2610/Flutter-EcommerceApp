import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/di/injection_container.dart';
import 'bloc/splash_cubit.dart';
import 'splash_screen.dart';

class SplashProvider extends StatelessWidget {
  const SplashProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => inject.get<SplashCubit>(),
      child: const SplashScreen(),
    );
  }
}
