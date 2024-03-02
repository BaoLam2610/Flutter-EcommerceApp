import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../../../gen/gen.dart';
import '../../../../app/presentation/widgets/language_app_bar.dart';
import '../../../domain/entities/login_info_entity.dart';
import '../../widgets/footer/login_social.dart';
import '../../widgets/input/email_input_field.dart';
import '../../widgets/input/password_input_field.dart';
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
    _loginCubit = ReadContext(context).read<LoginCubit>()..init();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  PreferredSizeWidget get _buildAppBar => LanguageAppBar(
        title: LocaleKeys.login.tr(),
        textStyle: AppTextStyles.bold24.copyWith(
          color: AppColors.current.primary,
        ),
      );

  Widget get _buildBody => BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          state.observeData<LoginInfoEntity>(
            context,
            onSuccess: (data, message) =>
                Navigator.pushReplacementNamed(context, AppRoutes.mainRoute),
          );
        },
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: ScrollColumnExpandable(
            children: [
              SizedBox(height: 18.h),
              Expanded(
                child: _buildLoginInputArea,
              ),
              SizedBox(height: 20.h),
              LoginSocial.login(
                onTapFooterText: () => context.navigator
                    .pushNamed(AppRoutes.registerRoute)
                    .then((value) {
                  if (value is String && value == AppKeys.popBackReload) {
                    _loginCubit.clearInputData();
                  }
                }),
              ),
            ],
          ),
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
            SizedBox(height: 48.h),
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
            errorText: state.emailError.tr(),
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
            errorText: state.passwordError.tr(),
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

  void _onForgotPasswordTextPressed() {
    // context.navigator.pushNamed(AppRoutes.forgotPasswordPage);
  }
}
