// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegisterImpl _$$UserRegisterImplFromJson(Map<String, dynamic> json) =>
    _$UserRegisterImpl(
      json['email'] as String,
      json['password'] as String,
      json['confirmPassword'] as String,
      json['profile'] == null
          ? null
          : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserRegisterImplToJson(_$UserRegisterImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'profile': instance.profile,
    };
