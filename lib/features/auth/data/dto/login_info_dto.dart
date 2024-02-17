import '../../domain/entities/login_info_entity.dart';
import '../../domain/entities/user_entity.dart';
import 'user_dto.dart';

class LoginInfoDto extends LoginInfoEntity {
  const LoginInfoDto({
    UserEntity? user,
    String? accessToken,
  }) : super(
          user: user,
          accessToken: accessToken ?? '',
        );

  factory LoginInfoDto.fromJson(Map<String, dynamic> json) {
    return LoginInfoDto(
      user: json['user'] == null ? null : UserDto.fromJson(json['user']),
      accessToken: json['accessToken'] as String,
    );
  }
}
