import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/routes/routes.dart';
import '../../../../configs/themes/themes.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/locale_keys.g.dart';
import 'social_card.dart';

enum LoginSocialType { login, register }

class LoginSocial extends StatelessWidget {
  final LoginSocialType type;

  const LoginSocial({super.key, required this.type});

  factory LoginSocial.login() => const LoginSocial(
        type: LoginSocialType.login,
      );

  factory LoginSocial.register() => const LoginSocial(
        type: LoginSocialType.register,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildLineOr,
          SizedBox(height: 20.h),
          _buildLoginWithSocial,
          SizedBox(height: 20.h),
          _buildFooterText(context),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget get _buildLineOr {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: AppColors.current.line,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          LocaleKeys.or.tr(),
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.current.secondaryText,
          ),
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: Container(
            height: 1.h,
            color: AppColors.current.line,
          ),
        ),
      ],
    );
  }

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

  Widget _buildFooterText(BuildContext context) => GestureDetector(
        onTap: () => _onTapFooter(context),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: _textFooter,
                style: AppTextStyles.regular16,
              ),
              TextSpan(
                text: _textAction,
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.current.primary,
                ),
              ),
            ],
          ),
        ),
      );

  void _onTapFooter(BuildContext context) {
    if (type == LoginSocialType.login) {
      context.navigator.pushNamed(AppRoutes.registerRoute);
      return;
    }
    context.navigator.maybePop();
  }

  String get _textFooter {
    if (type == LoginSocialType.login) {
      return LocaleKeys.dont_have_an_account.tr();
    } else {
      return LocaleKeys.do_have_an_account.tr();
    }
  }

  String get _textAction {
    if (type == LoginSocialType.login) {
      return LocaleKeys.register.tr();
    } else {
      return LocaleKeys.login.tr();
    }
  }
}
