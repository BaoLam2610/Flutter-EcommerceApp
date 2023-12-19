import 'package:equatable/equatable.dart';

import 'user_dto.dart';

class LoginDto extends Equatable {
  final UserDto userDto;
  final String accessToken;

  const LoginDto({
    required this.userDto,
    required this.accessToken,
  });

  factory LoginDto.fromJson(Map<String, dynamic> map) {
    return LoginDto(
      userDto: map['userDto'] as UserDto,
      accessToken: map['accessToken'] as String,
    );
  }

  @override
  List<Object> get props => [userDto, accessToken];
}