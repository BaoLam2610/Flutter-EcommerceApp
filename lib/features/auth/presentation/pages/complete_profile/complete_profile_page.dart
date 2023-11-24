import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../configs/themes/button_themes.dart';
import '../../../../../configs/themes/dimens.dart';
import '../../../../../configs/themes/text_themes.dart';
import '../../../../../core/bloc/bloc_state.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../../../core/widgets/scroll_column_expandable.dart';
import '../../../domain/models/profile/user_profile.dart';
import '../../../domain/models/register/user_register.dart';
import '../../widgets/label_text_field.dart';
import 'bloc/complete_profile_bloc.dart';

class CompleteProfilePage extends StatefulHookWidget {
  final UserRegister? args;
  const CompleteProfilePage({super.key, this.args});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _fullNameTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _addressTextController = TextEditingController();

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

  _buildBody() => BlocListener<CompleteProfileBloc, BlocState>(
        listener: (context, state) {
          if (state is Error) {
            context.showAlertDialog(
              title: text_error,
              content: state.message,
            );
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
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      );

  _buildTitle() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text_complete_profile,
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
            controller: _fullNameTextController,
            label: text_full_name,
            hint: text_full_name_hint,
            suffixIcon: const Icon(Icons.person_outline),
          ),
          const SizedBox(height: 20),
          LabelTextField(
            controller: _phoneTextController,
            label: text_phone_number,
            hint: text_phone_number_hint,
            suffixIcon: const Icon(Icons.phone_outlined),
          ),
          const SizedBox(height: 20),
          LabelTextField(
            controller: _addressTextController,
            label: text_address,
            hint: text_address_hint,
            suffixIcon: const Icon(Icons.location_on_outlined),
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
            text_register,
            style: context.buttonTextTheme,
          ),
        ),
      );

  void _onRegisterButtonPressed() {
    context
        .read<CompleteProfileBloc>()
        .add(ValidateCompleteProfile(widget.args?.copyWith(
            profile: UserProfile(
          _fullNameTextController.text.trim(),
          _phoneTextController.text.trim(),
          _addressTextController.text.trim(),
        ))));
  }
}
