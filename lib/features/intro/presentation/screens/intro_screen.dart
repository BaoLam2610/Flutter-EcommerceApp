import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/di/injection_container.dart';
import '../../../../configs/routes/routes.dart';
import '../../../../configs/themes/themes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/widgets/screen/base_screen.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../../app/presentation/bloc/global_app_cubit.dart';
import '../../../app/presentation/widgets/language_app_bar.dart';
import 'bloc/intro_cubit.dart';

class IntroScreen extends BaseScreen {
  const IntroScreen({super.key});

  @override
  BaseScreenState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends BaseScreenState<IntroScreen> {
  late IntroCubit _cubit;

  @override
  void initState() {
    _cubit = ReadContext(context).read<IntroCubit>();
    super.initState();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.background,
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  PreferredSizeWidget get _buildAppBar => LanguageAppBar(
        title: LocaleKeys.app_name.tr(),
        textStyle: AppTextStyles.bold32.copyWith(
          color: AppColors.current.primary,
          height: 1,
        ),
      );

  Widget get _buildBody => Column(
        children: [
          SizedBox(
            height: context.height * 0.5,
            child: PageView.builder(
              controller: _cubit.pageController,
              onPageChanged: (index) => _cubit.updateCurrentPage(index),
              itemCount: _cubit.introList.length,
              itemBuilder: (context, index) {
                final intro = _cubit.introList[index];
                return _buildPageItem(intro);
              },
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _cubit.introList.length,
              (index) => _buildDotIndicator(index: index),
            ),
          ),
          const Spacer(),
          _buildContinueButton,
          _buildSkipButton,
          SizedBox(height: 12.h),
        ],
      );

  Widget _buildPageItem(Map<String, dynamic> intro) =>
      BlocBuilder<IntroCubit, IntroState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  intro[AppKeys.text].toString(),
                  style: AppTextStyles.regular18,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(flex: 2),
              SizedBox(
                width: context.width * 0.6,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    intro[AppKeys.image].toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          );
        },
      );

  Widget _buildDotIndicator({required int index}) =>
      BlocBuilder<IntroCubit, IntroState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          return AnimatedContainer(
            duration: AppDurations.delayPagerIndicator,
            margin: EdgeInsets.only(right: 6.w),
            height: 6.h,
            width: _cubit.currentIndex == index ? 20.w : 6.w,
            decoration: BoxDecoration(
              color: _cubit.currentIndex == index
                  ? AppColors.current.primary
                  : AppColors.current.primarySup,
              borderRadius: BorderRadius.circular(4.r),
            ),
          );
        },
      );

  Widget get _buildContinueButton => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: AppButton.primary(
          text: LocaleKeys.text_continue.tr(),
          onTap: _cubit.increaseCurrentPage,
        ),
      );

  Widget get _buildSkipButton => Padding(
        padding: EdgeInsets.all(16.r),
        child: AppButton.secondary(
          text: LocaleKeys.skip.tr(),
          onTap: _onSkipButtonPressed,
        ),
      );

  void _onSkipButtonPressed() {
    _cubit.onSaveFirstOpenApp();
    context.navigator.pushReplacementNamed(AppRoutes.loginRoute);
  }
}
