import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/themes/themes.dart';
import '../../../../../core/bloc/bloc_state.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/screen/base_screen.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../../domain/entities/login_info_entity.dart';
import '../../widgets/email_input/email_input_field.dart';
import '../../widgets/password_input/password_input_field.dart';
import '../../widgets/social_card.dart';
import 'bloc/login_cubit.dart';
import 'widgets/remember_checkbox.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({super.key});

  @override
  BaseScreenState<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends BaseScreenState<LoginScreen> {
  late LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = ReadContext(context).read<LoginCubit>();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _buildBody,
    );
  }

  Widget get _buildBody => BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          state.status.observeData<LoginInfoEntity>(
            context,
            onSuccess: (data, message) {
              /*
              * Navigate to home screen
              * */
            },
          );
        },
        child: SizedBox(
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
            _emailInputField,
            SizedBox(height: 20.h),
            _passwordInputField,
            SizedBox(height: 20.h),
            _buildRememberMeArea,
            SizedBox(height: 32.h),
            _buildLoginButton,
          ],
        ),
      );

  Widget get _emailInputField => BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) =>
            previous.emailError != current.emailError,
        builder: (context, state) {
          return EmailInputField(
            controller: _loginCubit.emailController,
            errorText: state.emailError,
            onTextChanged: (text) => _loginCubit.validateEmail(),
          );
        },
      );

  Widget get _passwordInputField => BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) =>
            previous.passwordError != current.passwordError,
        builder: (context, state) {
          return PasswordInputField(
            controller: _loginCubit.passwordController,
            errorText: state.passwordError,
            onTextChanged: (text) => _loginCubit.validatePassword(),
          );
        },
      );

  Widget get _buildLoginButton => AppButton.primary(
        text: LocaleKeys.login.tr(),
        onTap: _loginCubit.doLogin,
      );

  Widget get _buildRememberMeArea => Row(
        children: [
          RememberCheckbox(_loginCubit),
          const Spacer(),
          GestureDetector(
            onTap: _onForgotPasswordTextPressed,
            child: Container(
              padding: EdgeInsets.only(bottom: 0.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.current.secondaryText,
                    width: 1.h,
                  ),
                ),
              ),
              child: Text(
                LocaleKeys.forgot_password.tr(),
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.current.secondaryText,
                ),
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
          SocialCard(icon: Assets.icons.googleIcon.path),
          SizedBox(width: 10.w),
          SocialCard(icon: Assets.icons.facebook2.path),
          SizedBox(width: 10.w),
          SocialCard(icon: Assets.icons.twitter.path),
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
