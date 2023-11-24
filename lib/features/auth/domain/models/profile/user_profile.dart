import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile(
    String fullName,
    String phoneNumber,
    String? address,
  ) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

// class UserProfile extends Equatable {
//   final String fullName;
//   final String phoneNumber;
//   final String? address;

//   const UserProfile({
//     required this.fullName,
//     required this.phoneNumber,
//     this.address,
//   });

//   @override
//   List<Object?> get props => [fullName, phoneNumber, address];
// }
