part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BlocState status;
  final String emailError;
  final String passwordError;

  const LoginState({
    required this.status,
    this.emailError = '',
    this.passwordError = '',
  });

  @override
  List<Object> get props => [status, emailError, passwordError];

  LoginState copyWith({
    BlocState? status,
    String? emailError,
    String? passwordError,
  }) {
    return LoginState(
      status: status ?? this.status,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}
