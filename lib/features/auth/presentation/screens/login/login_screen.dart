import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/themes/themes.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../widgets/label_text_field.dart';
import '../../widgets/social_card.dart';

class LoginScreen extends StatefulHookWidget {
  static const String route = '/login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool isRememberChecked = false;

  @override
  Widget build(BuildContext context) {
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
              flex: 2,
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
              style: AppTextStyles.bold24.copyWith(
                color: AppColors.current.primary,
              ),
            ),
          ],
        ),
      );

  Widget get _buildLoginInputArea => Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            LabelTextField(
              controller: _emailTextController,
              label: text_email,
              hint: text_email_hint,
              suffixIcon: const Icon(Icons.email_outlined),
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.h),
            LabelTextField(
              controller: _passwordTextController,
              label: text_password,
              hint: text_password_hint,
              suffixIcon: const Icon(Icons.lock_outline),
            ),
            SizedBox(height: 12.h),
            _buildRememberMeArea,
            SizedBox(height: 32.h),
            _buildLoginButton
          ],
        ),
      );

  Widget get _buildLoginButton => AppButton.primary(
        text: LocaleKeys.login.tr(),
      );

  Widget get _buildRememberMeArea => Row(
        children: [
          Checkbox(
            value: isRememberChecked,
            onChanged: (isChecked) {
              setState(() {
                isRememberChecked = isChecked ?? false;
              });
            },
          ),
          Text(
            LocaleKeys.remember_me.tr(),
            style: AppTextStyles.regular16.copyWith(
              color: AppColors.current.secondaryText,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _onForgotPasswordTextPressed,
            child: Text(
              LocaleKeys.forgot_password.tr(),
              style: AppTextStyles.regular16.copyWith(
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
                text: LocaleKeys.login.tr(),
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
