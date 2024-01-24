part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  final String email;
  const ForgotPasswordEvent(this.email);

  @override
  List<Object> get props => [email];
}

class ValidateEmail extends ForgotPasswordEvent {
  const ValidateEmail(String email) : super(email);
}

class SubmitEmail extends ForgotPasswordEvent {
  const SubmitEmail(String email) : super(email);
}