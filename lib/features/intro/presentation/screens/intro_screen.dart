import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/di/injection_container.dart';
import '../../../../configs/themes/app_colors.dart';
import '../../../../configs/themes/app_text_styles.dart';
import '../../../../core/constants/durations.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/screen/base_screen.dart';
import '../../../../core/widgets/button/app_button.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../../auth/presentation/screens/login/login_screen.dart';
import 'bloc/intro_cubit.dart';

class IntroScreen extends BaseScreen {
  static const String route = '/intro_screen';

  const IntroScreen({super.key});

  @override
  BaseScreenState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends BaseScreenState<IntroScreen> {
  late IntroCubit _cubit;

  @override
  void initState() {
    _cubit = sl.get<IntroCubit>();
    super.initState();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.background,
      body: SafeArea(child: _buildBody),
    );
  }

  Widget get _buildBody => BlocBuilder<IntroCubit, IntroState>(
        bloc: _cubit,
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) => Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  LocaleKeys.app_name.tr(),
                  style: AppTextStyles.bold32.copyWith(
                    color: AppColors.current.primary,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: PageView.builder(
                onPageChanged: (index) => _cubit.updateCurrentPage(index),
                itemCount: _cubit.introList.length,
                itemBuilder: (context, index) {
                  final intro = _cubit.introList[index];
                  return _buildPageItem(intro);
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _cubit.introList.length,
                        (index) => _buildDotIndicator(index: index),
                      ),
                    ),
                    const Spacer(),
                    _buildBottomButton,
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildPageItem(Map<String, dynamic> intro) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              intro[AppStrings.text].toString(),
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
                intro[AppStrings.image].toString(),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      );

  Widget _buildDotIndicator({required int index}) => AnimatedContainer(
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

  Widget get _buildBottomButton => Padding(
        padding: EdgeInsets.all(16.r),
        child: AppButton.primary(
          text: LocaleKeys.text_continue.tr(),
          onTap: _onButtonPressed,
        ),
      );

  void _onButtonPressed() {
    context.navigator.pushReplacementNamed(LoginScreen.route);
  }
}
