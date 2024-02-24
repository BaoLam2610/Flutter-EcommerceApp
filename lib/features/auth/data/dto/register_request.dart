import 'package:equatable/equatable.dart';

import '../../domain/entities/user_type.dart';

class RegisterRequest extends Equatable {
  final String email;
  final String password;
  final UserType userType;

  const RegisterRequest({
    required this.email,
    required this.password,
    required this.userType,
  });

  @override
  List<Object> get props => [email, password, userType];

  RegisterRequest copyWith({
    String? email,
    String? password,
    UserType? userType,
  }) {
    return RegisterRequest(
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