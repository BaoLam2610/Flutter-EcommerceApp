part of 'register_cubit.dart';

class RegisterState extends BaseState {
  final String emailError;
  final String passwordError;
  final String passwordConfirmError;

  const RegisterState({
    required super.status,
    this.emailError = '',
    this.passwordError = '',
    this.passwordConfirmError = '',
  });

  @override
  List<Object> get props => [
    status,
    emailError,
    passwordError,
    passwordConfirmError,
  ];

  RegisterState copyWith({
    Resource? status,
    String? emailError,
    String? passwordError,
    String? passwordConfirmError,
  }) {
    return RegisterState(
      status: status ?? this.status,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      passwordConfirmError: passwordConfirmError ?? this.passwordConfirmError,
    );
  }
}