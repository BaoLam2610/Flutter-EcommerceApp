import 'package:equatable/equatable.dart';

import 'user_type.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final UserType userType;

  const UserEntity({
    required this.id,
    required this.email,
    required this.userType,
  });

  @override
  List<Object> get props => [id, email, userType];
}
