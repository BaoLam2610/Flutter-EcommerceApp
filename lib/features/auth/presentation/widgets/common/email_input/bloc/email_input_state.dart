part of 'email_input_bloc.dart';


abstract class EmailInputState {}

class EmailInputInitial extends EmailInputState {}

class EmailValid extends EmailInputState {}

class EmailNotValid extends EmailInputState {
  final String message;

  EmailNotValid({
    required this.message,
  });
}
