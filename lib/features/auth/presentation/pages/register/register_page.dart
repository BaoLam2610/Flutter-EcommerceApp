import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../configs/routes/routes.dart';
import '../../../../../configs/themes/button_themes.dart';
import '../../../../../configs/themes/dimens.dart';
import '../../../../../configs/themes/text_themes.dart';
import '../../../../../core/bloc/bloc_state.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../../../core/widgets/scroll_column_expandable.dart';
import '../../../domain/models/register/user_register.dart';
import '../../widgets/label_text_field.dart';
import '../../widgets/social_card.dart';
import 'bloc/register_bloc.dart';

class RegisterPage extends StatefulHookWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() => AppBar(
        title: Text(
          text_sign_up,
          style: context.labelLarge,
        ),
      );

  _buildBody() => BlocListener<RegisterBloc, BlocState>(
        listenWhen: (previous, current) {
          return true;
        },
        listener: (context, state) {
          if (state is Error) {
            context.showAlertDialog(
              title: text_error,
              content: state.message,
            );
          }
          if (state is Success) {
            context.navigator.pushNamed(AppRoutes.completeProfilePage,
                arguments: state.data);
          }
        },
        child: ScrollColumnExpandable(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: [
            Expanded(
              flex: 1,
              child: _buildTitle(),
            ),
            Expanded(
              flex: 2,
              child: _buildRegisterInputArea(),
            ),
            Expanded(
              flex: 1,
              child: _buildFooterArea(),
            ),
          ],
        ),
      );

  _buildTitle() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text_register_account,
            style: context.headlineLarge?.copyWith(color: context.primary),
          ),
          const SizedBox(height: 12),
          Text(
            text_register_description,
            textAlign: TextAlign.center,
            style: context.bodyMedium?.copyWith(
              color: textColorGrey,
            ),
          ),
        ],
      );

  _buildRegisterInputArea() => Column(
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
          const SizedBox(height: 20),
          LabelTextField(
            controller: _confirmPasswordTextController,
            label: text_confirm_password,
            hint: text_confirm_password_hint,
            suffixIcon: const Icon(Icons.lock_outline),
            isPassword: true,
          ),
          const SizedBox(height: 32),
          _buildRegisterButton()
        ],
      );

  _buildRegisterButton() => SizedBox(
        height: buttonHeightLarge,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            _onRegisterButtonPressed();
          },
          style: primaryDefaultRoundedButtonTheme,
          child: Text(
            text_continue,
            style: context.buttonTextTheme,
          ),
        ),
      );

  _buildFooterArea() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildLoginWithSocial(),
          const SizedBox(height: 20),
          _buildSignUpText(),
          const SizedBox(height: 30),
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
  _buildSignUpText() => Text(
        text_register_with_social_description,
        style: context.bodyMedium?.copyWith(color: textColorGrey),
        textAlign: TextAlign.center,
      );

  void _onRegisterButtonPressed() {
    context.read<RegisterBloc>().add(
          ValidateRegister(
            UserRegister(
              _emailTextController.text.trim(),
              _passwordTextController.text.trim(),
              _confirmPasswordTextController.text.trim(),
              null,
            ),
          ),
        );
  }
}
