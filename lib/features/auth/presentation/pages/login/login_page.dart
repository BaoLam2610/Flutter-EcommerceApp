import 'package:flutter/material.dart';

import "../../../../../configs/themes/button_themes.dart";
import '../../../../../configs/themes/dimens.dart';
import '../../../../../configs/themes/text_themes.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../widgets/label_text_field.dart';
import '../../widgets/social_card.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() => AppBar(
        title: Text(
          text_sign_in,
          style: context.labelLarge?.copyWith(color: context.primary),
        ),
      );

  _buildBody() => SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: _buildTitle(),
              ),
              Expanded(
                flex: 2,
                child: _buildLoginInputArea(),
              ),
              Expanded(
                flex: 1,
                child: _buildFooterArea(),
              ),
            ],
          ),
        ),
      );

  _buildTitle() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text_welcome_back,
            style: context.headlineLarge,
          ),
          const SizedBox(height: 12),
          Text(
            text_login_description,
            textAlign: TextAlign.center,
            style: context.bodyMedium?.copyWith(
              color: textColorGrey,
            ),
          ),
        ],
      );

  _buildLoginInputArea() => Column(
        children: [
          const LabelTextField(
            label: text_email,
            hint: text_email_hint,
            suffixIcon: Icon(Icons.email_outlined),
          ),
          const SizedBox(height: 20),
          const LabelTextField(
            label: text_password,
            hint: text_password_hint,
            suffixIcon: Icon(Icons.lock_outline),
          ),
          const SizedBox(height: 12),
          _buildRememberMeArea(),
          const SizedBox(height: 32),
          SizedBox(
            height: buttonHeightLarge,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                style: primaryDefaultRoundedButtonTheme,
                child: Text(
                  text_login,
                  style: context.buttonTextTheme,
                )),
          )
        ],
      );

  _buildRememberMeArea() => Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          Text(
            text_remember_me,
            style: context.bodyMedium?.copyWith(color: textColorGrey),
          ),
          const Spacer(),
          Text(
            text_forgot_password,
            style: context.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
              color: textColorGrey,
            ),
          ),
        ],
      );

  _buildFooterArea() => Column(
        children: [
          _buildLoginWithSocial(),
          const SizedBox(height: 20),
          _buildSignUpText(),
        ],
      );

  _buildLoginWithSocial() => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialCard(icon: ic_google),
          SizedBox(width: 10),
          SocialCard(icon: ic_facebook),
          SizedBox(width: 10),
          SocialCard(icon: ic_twitter),
        ],
      );

  _buildSignUpText() => Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text_dont_have_an_account,
              style: context.bodyMedium?.copyWith(color: textColorGrey),
            ),
            TextSpan(
              text: text_sign_up,
              style: context.bodyMedium?.copyWith(color: context.primary),
            ),
          ],
        ),
      );
}
