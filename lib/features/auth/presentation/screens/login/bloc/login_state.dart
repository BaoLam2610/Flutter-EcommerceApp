part of 'login_cubit.dart';

class LoginState extends BaseState {
  final bool isRememberMe;
  final String passwordError;
  final String emailError;

  const LoginState({
    required super.status,
    this.isRememberMe = false,
    this.passwordError = '',
    this.emailError = '',
  });

  @override
  List<Object> get props => [
        status,
        isRememberMe,
        passwordError,
        emailError,
      ];

  LoginState copyWith({
    Resource? status,
    bool? isRememberMe,
    String? passwordError,
    String? emailError,
  }) {
    return LoginState(
      status: status ?? this.status,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      passwordError: passwordError ?? this.passwordError,
      emailError: emailError ?? this.emailError,
    );
  }
}
