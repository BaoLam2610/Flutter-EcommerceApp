import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
  final String id;
  final String email;
  final String userType;

  const UserDto({
    required this.id,
    required this.email,
    required this.userType,
  });

  factory UserDto.fromJson(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'] as String,
      email: map['email'] as String,
      userType: map['userType'] as String,
    );
  }

  @override
  List<Object> get props => [id, email, userType];
}
