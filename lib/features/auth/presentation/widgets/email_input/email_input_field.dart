import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../configs/di/injection_container.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';
import 'bloc/email_input_cubit.dart';

class EmailInputField extends StatelessWidget {
  final EmailInputCubit _cubit = inject.get<EmailInputCubit>();

  EmailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailInputCubit, EmailInputState>(
      bloc: _cubit,
      buildWhen: (previous, current) =>
          previous.emailError != current.emailError,
      builder: (context, state) {
        return LabelTextField(
          controller: _cubit.textController,
          label: LocaleKeys.email.tr(),
          hint: LocaleKeys.email_hint.tr(),
          suffixIcon: Assets.icons.email.svg(),
          inputType: TextInputType.emailAddress,
          errors: state.emailError,
          onChanged: (text) => _cubit.validateEmail(),
        );
      },
    );
  }
}