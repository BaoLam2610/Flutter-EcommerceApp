import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/di/injection_container.dart';
import '../auth/presentation/screens/intro/bloc/intro_cubit.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntroCubit>(
          create: (context) => sl.get<IntroCubit>(),
        ),
      ],
      child: child,
    );
  }
}
