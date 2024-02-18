import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/routes/routes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLogoVisible = false;

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
      () {
        context.navigator.pushReplacementNamed(AppRoutes.introRoute);
      },
    );
  }
}
