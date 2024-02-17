part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BlocState status;
  final String emailError;
  final String passwordError;
  final bool isShowPassword;
  final bool isRememberMe;

  const LoginState({
    required this.status,
    this.emailError = '',
    this.passwordError = '',
    this.isShowPassword = true,
    this.isRememberMe = false,
  });

  @override
  List<Object> get props => [
        status,
        emailError,
        passwordError,
        isShowPassword,
        isRememberMe,
      ];

  LoginState copyWith({
    BlocState? status,
    String? emailError,
    String? passwordError,
    bool? isShowPassword,
    bool? isRememberMe,
  }) {
    return LoginState(
      status: status ?? this.status,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }
}
