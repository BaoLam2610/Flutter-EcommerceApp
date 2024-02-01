import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/di/injection_container.dart';
import '../auth/presentation/screens/intro/bloc/intro_cubit.dart';

Widget multipleBlocProvidersContainer(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<IntroCubit>(
        create: (context) => sl.get<IntroCubit>(),
      ),
    ],
    child: child,
  );
}
