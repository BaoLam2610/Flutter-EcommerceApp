part of 'login_bloc.dart';

sealed class LoginEvent extends BlocEvent {
  final UserLogin? userLogin;

  const LoginEvent(this.userLogin);
}

class ValidateLogin extends LoginEvent {
  const ValidateLogin(UserLogin userLogin) : super(userLogin);
}

class DoLogin extends LoginEvent {
  const DoLogin(UserLogin userLogin) : super(userLogin);
}
