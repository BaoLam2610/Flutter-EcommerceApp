import '../../domain/entities/user_entity.dart';
import '../../domain/entities/user_type.dart';

class UserDto extends UserEntity {
  UserDto({
    String? id,
    String? email,
    String? userType,
  }) : super(
          id: id ?? '',
          email: email ?? '',
          userType: userType.userType,
        );

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      email: json['email'],
      userType: json['userType'],
    );
  }
}
