part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BlocState status;
  final bool isRememberMe;

  const LoginState({
    required this.status,
    this.isRememberMe = false,
  });

  @override
  List<Object> get props => [
        status,
        isRememberMe,
      ];

  LoginState copyWith({
    BlocState? status,
    bool? isRememberMe,
  }) {
    return LoginState(
      status: status ?? this.status,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }
}
