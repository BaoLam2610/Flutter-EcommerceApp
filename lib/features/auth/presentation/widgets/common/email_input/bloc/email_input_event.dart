part of 'email_input_bloc.dart';


abstract class EmailInputEvent {
  final String email;
  const EmailInputEvent(this.email);
}

class ValidateEmail extends EmailInputEvent {
  ValidateEmail(super.email);
}