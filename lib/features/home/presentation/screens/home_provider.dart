import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/di/injection_container.dart';
import '../../home.dart';
import 'bloc/home_cubit.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => inject.get<HomeCubit>(),
      child: const HomeScreen(),
    );
  }
}
