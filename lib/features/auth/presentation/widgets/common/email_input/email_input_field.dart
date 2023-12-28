import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/strings.dart';
import '../../../../../../utils/logger.dart';
import '../../label_text_field.dart';
import 'bloc/email_input_bloc.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({super.key});

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailInputBloc, EmailInputState>(
      builder: (context, state) {
        Log.debug('rebuild input');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelTextField(
              controller: _emailTextController,
              label: text_email,
              hint: text_email_hint,
              suffixIcon: const Icon(Icons.email_outlined),
              inputType: TextInputType.emailAddress,
              onChanged: (text) {
                context.read<EmailInputBloc>().add(
                      ValidateEmail(_emailTextController.text),
                    );
              },
            ),
            if (state is EmailNotValid) ...[
              const SizedBox(
                height: 2,
              ),
              Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            ]
          ],
        );
      },
    );
  }
}
