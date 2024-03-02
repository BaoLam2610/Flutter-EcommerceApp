import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/bloc_state.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import 'bloc/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ReadContext(context).read<SplashCubit>()
      ..init()
      ..fetchDataStorage()
      ..openNextScreenListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody => BlocConsumer<SplashCubit, SplashState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status is Success) {
            context.navigator.pushReplacementNamed(state.nextRoute);
          }
        },
        buildWhen: (previous, current) =>
            previous.isLogoVisible != current.isLogoVisible,
        builder: (context, state) {
          return Center(
            child: AnimatedOpacity(
              opacity: state.isLogoVisible ? 1 : 0,
              duration: AppDurations.delayFadedIconApp,
              child: Assets.icons.logoApp.svg(
                width: 100.r,
                height: 100.r,
              ),
            ),
          );
        },
      );
}
