import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import "../../../../../configs/themes/button_themes.dart";
import '../../../../../configs/themes/dimens.dart';
import '../../../../../configs/themes/text_themes.dart';
import '../../../../../core/bloc/bloc_state.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../domain/models/user_login.dart';
import '../../widgets/label_text_field.dart';
import '../../widgets/social_card.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulHookWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool isRememberChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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

  _buildBody() => BlocConsumer<LoginBloc, BlocState>(
        listener: (context, state) {
          if (state is Error) {
            context.showAlertDialog(
              title: text_error,
              content: state.message,
            );
          }
        },
        builder: (context, state) {
          return SizedBox(
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
        },
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LabelTextField(
            controller: _emailTextController,
            label: text_email,
            hint: text_email_hint,
            suffixIcon: const Icon(Icons.email_outlined),
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          LabelTextField(
            controller: _passwordTextController,
            label: text_password,
            hint: text_password_hint,
            suffixIcon: const Icon(Icons.lock_outline),
            isPassword: true,
          ),
          const SizedBox(height: 12),
          _buildRememberMeArea(),
          const SizedBox(height: 32),
          SizedBox(
            height: buttonHeightLarge,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _onButtonLoginTapped();
              },
              style: primaryDefaultRoundedButtonTheme,
              child: Text(
                text_login,
                style: context.buttonTextTheme,
              ),
            ),
          ),
        ],
      );

  _buildRememberMeArea() => Row(
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
        mainAxisAlignment: MainAxisAlignment.center,
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

  void _onButtonLoginTapped() {
    context.read<LoginBloc>().add(
          ValidateLogin(
            UserLogin(
              email: _emailTextController.text,
              password: _passwordTextController.text,
            ),
          ),
        );
  }
}
