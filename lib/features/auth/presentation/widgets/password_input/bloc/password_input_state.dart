part of 'password_input_cubit.dart';

class PasswordInputState extends Equatable {
  final String passwordError;
  final bool isShowPassword;

  const PasswordInputState({
    this.passwordError = '',
    this.isShowPassword = false,
  });

  @override
  List<Object> get props => [passwordError, isShowPassword];

  PasswordInputState copyWith({
    String? passwordError,
    bool? isShowPassword,
  }) {
    return PasswordInputState(
      passwordError: passwordError ?? this.passwordError,
      isShowPassword: isShowPassword ?? this.isShowPassword,
    );
  }
}
