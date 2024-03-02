import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/di/injection_container.dart';
import 'bloc/category_cubit.dart';
import 'category_screen.dart';

class CategoryProvider extends StatelessWidget {
  const CategoryProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryCubit>(
      create: (context) => inject.get<CategoryCubit>(),
      child: const CategoryScreen(),
    );
  }
}
