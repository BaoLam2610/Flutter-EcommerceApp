part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BlocState status;
  final String emailError;
  final String passwordError;
  final bool isShowPassword;

  const LoginState({
    required this.status,
    this.emailError = '',
    this.passwordError = '',
    this.isShowPassword = true,
  });

  @override
  List<Object> get props => [status, emailError, passwordError, isShowPassword];

  LoginState copyWith({
    BlocState? status,
    String? emailError,
    String? passwordError,
    bool? isShowPassword,
  }) {
    return LoginState(
      status: status ?? this.status,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isShowPassword: isShowPassword ?? this.isShowPassword,
    );
  }
}
