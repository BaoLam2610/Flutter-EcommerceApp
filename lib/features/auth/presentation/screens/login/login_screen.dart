import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/di/injection_container.dart';
import '../../../../../configs/themes/themes.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/screen/base_screen.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../widgets/social_card.dart';
import 'bloc/login_cubit.dart';
import 'widgets/email_input_field.dart';
import 'widgets/password_input_field.dart';

class LoginScreen extends BaseScreen {
  static const String route = '/login_screen';

  const LoginScreen({super.key});

  @override
  BaseScreenState<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends BaseScreenState<LoginScreen> {
  late LoginCubit _loginCubit;
  bool isRememberChecked = false;

  @override
  void initState() {
    super.initState();
    _loginCubit = inject<LoginCubit>();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _buildBody,
    );
  }

  Widget get _buildBody => SizedBox(
        height: context.height,
        width: context.width,
        child: ScrollColumnExpandable(
          children: [
            Expanded(
              flex: 1,
              child: _buildTitle,
            ),
            Expanded(
              flex: 3,
              child: _buildLoginInputArea,
            ),
            Expanded(
              flex: 1,
              child: _buildFooterArea,
            ),
          ],
        ),
      );

  Widget get _buildTitle => Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 12.h),
            Text(
              LocaleKeys.login.tr(),
              style: AppTextStyles.bold32.copyWith(
                color: AppColors.current.primary,
              ),
            ),
          ],
        ),
      );

  Widget get _buildLoginInputArea => Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            EmailInputField(_loginCubit),
            SizedBox(height: 20.h),
            PasswordInputField(_loginCubit),
            SizedBox(height: 20.h),
            _buildRememberMeArea,
            SizedBox(height: 32.h),
            _buildLoginButton,
          ],
        ),
      );

  Widget get _buildLoginButton => AppButton.primary(
        text: LocaleKeys.login.tr(),
        onTap: _loginCubit.doLogin,
      );

  Widget get _buildRememberMeArea => Row(
        children: [
          SizedBox(
            width: 24.r,
            height: 24.r,
            child: Checkbox(
              value: isRememberChecked,
              onChanged: (isChecked) {
                setState(() {
                  isRememberChecked = isChecked ?? false;
                });
              },
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            LocaleKeys.remember_me.tr(),
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.current.secondaryText,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _onForgotPasswordTextPressed,
            child: Text(
              LocaleKeys.forgot_password.tr(),
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.current.secondaryText,
              ),
            ),
          ),
        ],
      );

  Widget get _buildFooterArea => Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildLoginWithSocial,
            SizedBox(height: 20.h),
            _buildSignUpText,
            SizedBox(height: 30.h),
          ],
        ),
      );

  Widget get _buildLoginWithSocial => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SocialCard(icon: ic_google),
          SizedBox(width: 10.w),
          const SocialCard(icon: ic_facebook),
          SizedBox(width: 10.w),
          const SocialCard(icon: ic_twitter),
        ],
      );

  Widget get _buildSignUpText => GestureDetector(
        onTap: _onRegisterTextPressed,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.dont_have_an_account.tr(),
                style: AppTextStyles.regular16,
              ),
              TextSpan(
                text: LocaleKeys.register.tr(),
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.current.primary,
                ),
              ),
            ],
          ),
        ),
      );

  void _onLoginButtonPressed() {
    // context.read<LoginBloc>().add(
    //       ValidateLogin(
    //         UserLogin(
    //           email: _emailTextController.text,
    //           password: _passwordTextController.text,
    //         ),
    //       ),
    //     );
  }

  void _onForgotPasswordTextPressed() {
    // context.navigator.pushNamed(AppRoutes.forgotPasswordPage);
  }

  void _onRegisterTextPressed() {
    // context.navigator.pushNamed(AppRoutes.registerPage);
  }
}
