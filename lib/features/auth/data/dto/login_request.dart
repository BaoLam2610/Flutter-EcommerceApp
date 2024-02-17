import 'package:equatable/equatable.dart';

import '../../domain/entities/user_type.dart';

class LoginRequest extends Equatable {
  final String email;
  final String password;
  final UserType userType;

  const LoginRequest({
    required this.email,
    required this.password,
    required this.userType,
  });

  @override
  List<Object> get props => [email, password, userType];

  LoginRequest copyWith({
    String? email,
    String? password,
    UserType? userType,
  }) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toJson() => {
      'email': email,
      'password': password,
      'userType': userType.key,
    };
}