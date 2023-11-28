// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'special_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecialOfferDto _$SpecialOfferDtoFromJson(Map<String, dynamic> json) {
  return _SpecialOfferDto.fromJson(json);
}

/// @nodoc
mixin _$SpecialOfferDto {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get totalBrands => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialOfferDtoCopyWith<SpecialOfferDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialOfferDtoCopyWith<$Res> {
  factory $SpecialOfferDtoCopyWith(
          SpecialOfferDto value, $Res Function(SpecialOfferDto) then) =
      _$SpecialOfferDtoCopyWithImpl<$Res, SpecialOfferDto>;
  @useResult
  $Res call({String? id, String? title, String? image, int? totalBrands});
}

/// @nodoc
class _$SpecialOfferDtoCopyWithImpl<$Res, $Val extends SpecialOfferDto>
    implements $SpecialOfferDtoCopyWith<$Res> {
  _$SpecialOfferDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? totalBrands = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      totalBrands: freezed == totalBrands
          ? _value.totalBrands
          : totalBrands // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialOfferDtoImplCopyWith<$Res>
    implements $SpecialOfferDtoCopyWith<$Res> {
  factory _$$SpecialOfferDtoImplCopyWith(_$SpecialOfferDtoImpl value,
          $Res Function(_$SpecialOfferDtoImpl) then) =
      __$$SpecialOfferDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? title, String? image, int? totalBrands});
}

/// @nodoc
class __$$SpecialOfferDtoImplCopyWithImpl<$Res>
    extends _$SpecialOfferDtoCopyWithImpl<$Res, _$SpecialOfferDtoImpl>
    implements _$$SpecialOfferDtoImplCopyWith<$Res> {
  __$$SpecialOfferDtoImplCopyWithImpl(
      _$SpecialOfferDtoImpl _value, $Res Function(_$SpecialOfferDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? totalBrands = freezed,
  }) {
    return _then(_$SpecialOfferDtoImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == totalBrands
          ? _value.totalBrands
          : totalBrands // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialOfferDtoImpl implements _SpecialOfferDto {
  _$SpecialOfferDtoImpl(this.id, this.title, this.image, this.totalBrands);

  factory _$SpecialOfferDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialOfferDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final int? totalBrands;

  @override
  String toString() {
    return 'SpecialOfferDto(id: $id, title: $title, image: $image, totalBrands: $totalBrands)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialOfferDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.totalBrands, totalBrands) ||
                other.totalBrands == totalBrands));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image, totalBrands);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialOfferDtoImplCopyWith<_$SpecialOfferDtoImpl> get copyWith =>
      __$$SpecialOfferDtoImplCopyWithImpl<_$SpecialOfferDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialOfferDtoImplToJson(
      this,
    );
  }
}

abstract class _SpecialOfferDto implements SpecialOfferDto {
  factory _SpecialOfferDto(final String? id, final String? title,
      final String? image, final int? totalBrands) = _$SpecialOfferDtoImpl;

  factory _SpecialOfferDto.fromJson(Map<String, dynamic> json) =
      _$SpecialOfferDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get image;
  @override
  int? get totalBrands;
  @override
  @JsonKey(ignore: true)
  _$$SpecialOfferDtoImplCopyWith<_$SpecialOfferDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
