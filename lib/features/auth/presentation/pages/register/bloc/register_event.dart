part of 'register_bloc.dart';

sealed class RegisterEvent extends BlocEvent {
  final UserRegister? userRegister;

  const RegisterEvent(this.userRegister);
}

class ValidateRegister extends RegisterEvent {
  const ValidateRegister(UserRegister userRegister) : super(userRegister);
}
