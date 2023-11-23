part of 'login_bloc.dart';

sealed class LoginEvent extends BlocEvent {
  final UserLogin? userLogin;

  const LoginEvent(this.userLogin);
}

class ValidateLogin extends LoginEvent {
  const ValidateLogin(UserLogin userLogin) : super(userLogin);
}

class CallLogin extends LoginEvent {
  const CallLogin(UserLogin userLogin) : super(userLogin);
}
