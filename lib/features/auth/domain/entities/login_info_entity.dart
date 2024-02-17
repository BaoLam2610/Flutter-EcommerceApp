import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class LoginInfoEntity extends Equatable {
  final UserEntity? user;
  final String accessToken;

  const LoginInfoEntity({
    this.user,
    required this.accessToken,
  });

  @override
  List<Object?> get props => [user, accessToken];

  @override
  String toString() {
    return 'LoginInfoEntity{user: $user, accessToken: $accessToken}';
  }
}
