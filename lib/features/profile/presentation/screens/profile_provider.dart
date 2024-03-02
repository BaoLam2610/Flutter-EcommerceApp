import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/configs.dart';
import 'bloc/profile_cubit.dart';
import 'profile_screen.dart';

class ProfileProvider extends StatelessWidget {
  const ProfileProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => inject.get<ProfileCubit>(),
      child: const ProfileScreen(),
    );
  }
}
