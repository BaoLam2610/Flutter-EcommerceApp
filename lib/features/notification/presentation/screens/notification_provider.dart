import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/di/injection_container.dart';
import 'bloc/notification_cubit.dart';
import 'notification_screen.dart';

class NotificationProvider extends StatelessWidget {
  const NotificationProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationCubit>(
      create: (context) => inject.get<NotificationCubit>(),
      child: const NotificationScreen(),
    );
  }
}
