import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/configs.dart';
import 'bloc/store_cubit.dart';
import 'store_screen.dart';

class StoreProvider extends StatelessWidget {
  const StoreProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoreCubit>(
      create: (context) => inject.get<StoreCubit>(),
      child: const StoreScreen(),
    );
  }
}
