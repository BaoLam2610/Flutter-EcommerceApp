import 'package:freezed_annotation/freezed_annotation.dart';

import '../profile/user_profile.dart';

part 'user_register.freezed.dart';
part 'user_register.g.dart';

@freezed
class UserRegister with _$UserRegister {

  factory UserRegister(
    String email,
String password,
String confirmPassword,
UserProfile? profile,
  ) = _UserRegister;

  factory UserRegister.fromJson(Map<String, dynamic> json) => _$UserRegisterFromJson(json);
}

// class UserRegister extends Equatable {
//   final String email;
//   final String password;
//   final String confirmPassword;
//   final UserProfile? profile;

//   const UserRegister({
//     required this.email,
//     required this.password,
//     required this.confirmPassword,
//     this.profile,
//   });

//   @override
//   List<Object?> get props => [email, password, confirmPassword, profile];
// }
