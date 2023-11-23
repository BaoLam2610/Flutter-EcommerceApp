import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {
  final String email;
  final String password;
  
  const UserLogin({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
