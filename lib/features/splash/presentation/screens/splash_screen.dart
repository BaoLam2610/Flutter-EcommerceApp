import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/routes/routes.dart';
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
  late SplashCubit _cubit;
  bool _isLogoVisible = false;
  bool _isFirstOpenApp = false;

  void checkFirstOpenApp() async {
    _isFirstOpenApp = await _cubit.isFirstOpenApp();
  }

  @override
  void initState() {
    super.initState();
    _cubit = ReadContext(context).read<SplashCubit>()..fetchDataStorage();
    checkFirstOpenApp();
  }

  @override
  Widget build(BuildContext context) {
    _initLogoListener();
    _onOpenIntroScreen(context);
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody => Center(
        child: AnimatedOpacity(
          opacity: _isLogoVisible ? 1 : 0,
          duration: AppDurations.delayFadedIconApp,
          child: Assets.icons.logoApp.svg(
            width: 100.r,
            height: 100.r,
          ),
        ),
      );

  void _initLogoListener() {
    if (_isLogoVisible) {
      return;
    }

    Future.delayed(
      const Duration(microseconds: 10),
      () => setState(() => _isLogoVisible = true),
    );
  }

  void _onOpenIntroScreen(BuildContext context) {
    if (_isLogoVisible) {
      return;
    }

    Future.delayed(
      AppDurations.delaySplash,
      () => context.navigator.pushReplacementNamed(
          _isFirstOpenApp ? AppRoutes.introRoute : AppRoutes.loginRoute,
          ),
    );
  }
}
