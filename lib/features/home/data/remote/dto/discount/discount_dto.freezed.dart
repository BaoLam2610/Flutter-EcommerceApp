// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscountDto _$DiscountDtoFromJson(Map<String, dynamic> json) {
  return _DiscountDto.fromJson(json);
}

/// @nodoc
mixin _$DiscountDto {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountDtoCopyWith<DiscountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountDtoCopyWith<$Res> {
  factory $DiscountDtoCopyWith(
          DiscountDto value, $Res Function(DiscountDto) then) =
      _$DiscountDtoCopyWithImpl<$Res, DiscountDto>;
  @useResult
  $Res call({String? id, String? title, String? description, String? image});
}

/// @nodoc
class _$DiscountDtoCopyWithImpl<$Res, $Val extends DiscountDto>
    implements $DiscountDtoCopyWith<$Res> {
  _$DiscountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountDtoImplCopyWith<$Res>
    implements $DiscountDtoCopyWith<$Res> {
  factory _$$DiscountDtoImplCopyWith(
          _$DiscountDtoImpl value, $Res Function(_$DiscountDtoImpl) then) =
      __$$DiscountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? title, String? description, String? image});
}

/// @nodoc
class __$$DiscountDtoImplCopyWithImpl<$Res>
    extends _$DiscountDtoCopyWithImpl<$Res, _$DiscountDtoImpl>
    implements _$$DiscountDtoImplCopyWith<$Res> {
  __$$DiscountDtoImplCopyWithImpl(
      _$DiscountDtoImpl _value, $Res Function(_$DiscountDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_$DiscountDtoImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountDtoImpl implements _DiscountDto {
  _$DiscountDtoImpl(this.id, this.title, this.description, this.image);

  factory _$DiscountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? image;

  @override
  String toString() {
    return 'DiscountDto(id: $id, title: $title, description: $description, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountDtoImplCopyWith<_$DiscountDtoImpl> get copyWith =>
      __$$DiscountDtoImplCopyWithImpl<_$DiscountDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountDtoImplToJson(
      this,
    );
  }
}

abstract class _DiscountDto implements DiscountDto {
  factory _DiscountDto(final String? id, final String? title,
      final String? description, final String? image) = _$DiscountDtoImpl;

  factory _DiscountDto.fromJson(Map<String, dynamic> json) =
      _$DiscountDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$DiscountDtoImplCopyWith<_$DiscountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
