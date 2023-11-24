// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) {
  return _UserRegister.fromJson(json);
}

/// @nodoc
mixin _$UserRegister {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  UserProfile? get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegisterCopyWith<UserRegister> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterCopyWith<$Res> {
  factory $UserRegisterCopyWith(
          UserRegister value, $Res Function(UserRegister) then) =
      _$UserRegisterCopyWithImpl<$Res, UserRegister>;
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      UserProfile? profile});

  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$UserRegisterCopyWithImpl<$Res, $Val extends UserRegister>
    implements $UserRegisterCopyWith<$Res> {
  _$UserRegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserRegisterImplCopyWith<$Res>
    implements $UserRegisterCopyWith<$Res> {
  factory _$$UserRegisterImplCopyWith(
          _$UserRegisterImpl value, $Res Function(_$UserRegisterImpl) then) =
      __$$UserRegisterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      UserProfile? profile});

  @override
  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$UserRegisterImplCopyWithImpl<$Res>
    extends _$UserRegisterCopyWithImpl<$Res, _$UserRegisterImpl>
    implements _$$UserRegisterImplCopyWith<$Res> {
  __$$UserRegisterImplCopyWithImpl(
      _$UserRegisterImpl _value, $Res Function(_$UserRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? profile = freezed,
  }) {
    return _then(_$UserRegisterImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegisterImpl implements _UserRegister {
  _$UserRegisterImpl(
      this.email, this.password, this.confirmPassword, this.profile);

  factory _$UserRegisterImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegisterImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final UserProfile? profile;

  @override
  String toString() {
    return 'UserRegister(email: $email, password: $password, confirmPassword: $confirmPassword, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, confirmPassword, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterImplCopyWith<_$UserRegisterImpl> get copyWith =>
      __$$UserRegisterImplCopyWithImpl<_$UserRegisterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegisterImplToJson(
      this,
    );
  }
}

abstract class _UserRegister implements UserRegister {
  factory _UserRegister(
      final String email,
      final String password,
      final String confirmPassword,
      final UserProfile? profile) = _$UserRegisterImpl;

  factory _UserRegister.fromJson(Map<String, dynamic> json) =
      _$UserRegisterImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  UserProfile? get profile;
  @override
  @JsonKey(ignore: true)
  _$$UserRegisterImplCopyWith<_$UserRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
