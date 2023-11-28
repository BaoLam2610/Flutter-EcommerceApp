// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PopularProductDto _$PopularProductDtoFromJson(Map<String, dynamic> json) {
  return _PopularProductDto.fromJson(json);
}

/// @nodoc
mixin _$PopularProductDto {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  double? get price =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularProductDtoCopyWith<PopularProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularProductDtoCopyWith<$Res> {
  factory $PopularProductDtoCopyWith(
          PopularProductDto value, $Res Function(PopularProductDto) then) =
      _$PopularProductDtoCopyWithImpl<$Res, PopularProductDto>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? image,
      double? price,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class _$PopularProductDtoCopyWithImpl<$Res, $Val extends PopularProductDto>
    implements $PopularProductDtoCopyWith<$Res> {
  _$PopularProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularProductDtoImplCopyWith<$Res>
    implements $PopularProductDtoCopyWith<$Res> {
  factory _$$PopularProductDtoImplCopyWith(_$PopularProductDtoImpl value,
          $Res Function(_$PopularProductDtoImpl) then) =
      __$$PopularProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? image,
      double? price,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class __$$PopularProductDtoImplCopyWithImpl<$Res>
    extends _$PopularProductDtoCopyWithImpl<$Res, _$PopularProductDtoImpl>
    implements _$$PopularProductDtoImplCopyWith<$Res> {
  __$$PopularProductDtoImplCopyWithImpl(_$PopularProductDtoImpl _value,
      $Res Function(_$PopularProductDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$PopularProductDtoImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularProductDtoImpl implements _PopularProductDto {
  _$PopularProductDtoImpl(this.id, this.name, this.image, this.price,
      @JsonKey(name: 'is_favorite') this.isFavorite);

  factory _$PopularProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularProductDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final double? price;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  @override
  String toString() {
    return 'PopularProductDto(id: $id, name: $name, image: $image, price: $price, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularProductDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, price, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularProductDtoImplCopyWith<_$PopularProductDtoImpl> get copyWith =>
      __$$PopularProductDtoImplCopyWithImpl<_$PopularProductDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularProductDtoImplToJson(
      this,
    );
  }
}

abstract class _PopularProductDto implements PopularProductDto {
  factory _PopularProductDto(
          final String? id,
          final String? name,
          final String? image,
          final double? price,
          @JsonKey(name: 'is_favorite') final bool? isFavorite) =
      _$PopularProductDtoImpl;

  factory _PopularProductDto.fromJson(Map<String, dynamic> json) =
      _$PopularProductDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  double? get price;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$PopularProductDtoImplCopyWith<_$PopularProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
