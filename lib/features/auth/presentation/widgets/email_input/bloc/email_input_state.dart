part of 'email_input_cubit.dart';

class EmailInputState extends Equatable {
  final String emailError;

  const EmailInputState({
    this.emailError = '',
  });

  @override
  List<Object> get props => [emailError];

  EmailInputState copyWith({
    String? emailError,
  }) {
    return EmailInputState(
      emailError: emailError ?? this.emailError,
    );
  }
}
