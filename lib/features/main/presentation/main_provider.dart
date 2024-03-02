import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/configs.dart';
import 'bloc/main_cubit.dart';
import 'main_screen.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => inject.get<MainCubit>(),
      child: const MainScreen(),
    );
  }
}
