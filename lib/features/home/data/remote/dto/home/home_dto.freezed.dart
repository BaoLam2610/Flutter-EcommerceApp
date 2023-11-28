// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeDto _$HomeDtoFromJson(Map<String, dynamic> json) {
  return _HomeDto.fromJson(json);
}

/// @nodoc
mixin _$HomeDto {
  DiscountDto? get discount => throw _privateConstructorUsedError;
  List<CategoryDto>? get categories =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'specials')
  List<SpecialOfferDto>? get specials =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'popular_products')
  List<PopularProductDto>? get popularProducts =>
      throw _privateConstructorUsedError;
  NotificationDto? get notification => throw _privateConstructorUsedError;
  CartDto? get cart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeDtoCopyWith<HomeDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDtoCopyWith<$Res> {
  factory $HomeDtoCopyWith(HomeDto value, $Res Function(HomeDto) then) =
      _$HomeDtoCopyWithImpl<$Res, HomeDto>;
  @useResult
  $Res call(
      {DiscountDto? discount,
      List<CategoryDto>? categories,
      @JsonKey(name: 'specials') List<SpecialOfferDto>? specials,
      @JsonKey(name: 'popular_products')
      List<PopularProductDto>? popularProducts,
      NotificationDto? notification,
      CartDto? cart});

  $DiscountDtoCopyWith<$Res>? get discount;
  $NotificationDtoCopyWith<$Res>? get notification;
  $CartDtoCopyWith<$Res>? get cart;
}

/// @nodoc
class _$HomeDtoCopyWithImpl<$Res, $Val extends HomeDto>
    implements $HomeDtoCopyWith<$Res> {
  _$HomeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = freezed,
    Object? categories = freezed,
    Object? specials = freezed,
    Object? popularProducts = freezed,
    Object? notification = freezed,
    Object? cart = freezed,
  }) {
    return _then(_value.copyWith(
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as DiscountDto?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDto>?,
      specials: freezed == specials
          ? _value.specials
          : specials // ignore: cast_nullable_to_non_nullable
              as List<SpecialOfferDto>?,
      popularProducts: freezed == popularProducts
          ? _value.popularProducts
          : popularProducts // ignore: cast_nullable_to_non_nullable
              as List<PopularProductDto>?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationDto?,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as CartDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountDtoCopyWith<$Res>? get discount {
    if (_value.discount == null) {
      return null;
    }

    return $DiscountDtoCopyWith<$Res>(_value.discount!, (value) {
      return _then(_value.copyWith(discount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationDtoCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $NotificationDtoCopyWith<$Res>(_value.notification!, (value) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CartDtoCopyWith<$Res>? get cart {
    if (_value.cart == null) {
      return null;
    }

    return $CartDtoCopyWith<$Res>(_value.cart!, (value) {
      return _then(_value.copyWith(cart: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeDtoImplCopyWith<$Res> implements $HomeDtoCopyWith<$Res> {
  factory _$$HomeDtoImplCopyWith(
          _$HomeDtoImpl value, $Res Function(_$HomeDtoImpl) then) =
      __$$HomeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DiscountDto? discount,
      List<CategoryDto>? categories,
      @JsonKey(name: 'specials') List<SpecialOfferDto>? specials,
      @JsonKey(name: 'popular_products')
      List<PopularProductDto>? popularProducts,
      NotificationDto? notification,
      CartDto? cart});

  @override
  $DiscountDtoCopyWith<$Res>? get discount;
  @override
  $NotificationDtoCopyWith<$Res>? get notification;
  @override
  $CartDtoCopyWith<$Res>? get cart;
}

/// @nodoc
class __$$HomeDtoImplCopyWithImpl<$Res>
    extends _$HomeDtoCopyWithImpl<$Res, _$HomeDtoImpl>
    implements _$$HomeDtoImplCopyWith<$Res> {
  __$$HomeDtoImplCopyWithImpl(
      _$HomeDtoImpl _value, $Res Function(_$HomeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = freezed,
    Object? categories = freezed,
    Object? specials = freezed,
    Object? popularProducts = freezed,
    Object? notification = freezed,
    Object? cart = freezed,
  }) {
    return _then(_$HomeDtoImpl(
      freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as DiscountDto?,
      freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDto>?,
      freezed == specials
          ? _value._specials
          : specials // ignore: cast_nullable_to_non_nullable
              as List<SpecialOfferDto>?,
      freezed == popularProducts
          ? _value._popularProducts
          : popularProducts // ignore: cast_nullable_to_non_nullable
              as List<PopularProductDto>?,
      freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationDto?,
      freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as CartDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDtoImpl implements _HomeDto {
  _$HomeDtoImpl(
      this.discount,
      final List<CategoryDto>? categories,
      @JsonKey(name: 'specials') final List<SpecialOfferDto>? specials,
      @JsonKey(name: 'popular_products')
      final List<PopularProductDto>? popularProducts,
      this.notification,
      this.cart)
      : _categories = categories,
        _specials = specials,
        _popularProducts = popularProducts;

  factory _$HomeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeDtoImplFromJson(json);

  @override
  final DiscountDto? discount;
  final List<CategoryDto>? _categories;
  @override
  List<CategoryDto>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// ignore: invalid_annotation_target
  final List<SpecialOfferDto>? _specials;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'specials')
  List<SpecialOfferDto>? get specials {
    final value = _specials;
    if (value == null) return null;
    if (_specials is EqualUnmodifiableListView) return _specials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// ignore: invalid_annotation_target
  final List<PopularProductDto>? _popularProducts;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'popular_products')
  List<PopularProductDto>? get popularProducts {
    final value = _popularProducts;
    if (value == null) return null;
    if (_popularProducts is EqualUnmodifiableListView) return _popularProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final NotificationDto? notification;
  @override
  final CartDto? cart;

  @override
  String toString() {
    return 'HomeDto(discount: $discount, categories: $categories, specials: $specials, popularProducts: $popularProducts, notification: $notification, cart: $cart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDtoImpl &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._specials, _specials) &&
            const DeepCollectionEquality()
                .equals(other._popularProducts, _popularProducts) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      discount,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_specials),
      const DeepCollectionEquality().hash(_popularProducts),
      notification,
      cart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDtoImplCopyWith<_$HomeDtoImpl> get copyWith =>
      __$$HomeDtoImplCopyWithImpl<_$HomeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDtoImplToJson(
      this,
    );
  }
}

abstract class _HomeDto implements HomeDto {
  factory _HomeDto(
      final DiscountDto? discount,
      final List<CategoryDto>? categories,
      @JsonKey(name: 'specials') final List<SpecialOfferDto>? specials,
      @JsonKey(name: 'popular_products')
      final List<PopularProductDto>? popularProducts,
      final NotificationDto? notification,
      final CartDto? cart) = _$HomeDtoImpl;

  factory _HomeDto.fromJson(Map<String, dynamic> json) = _$HomeDtoImpl.fromJson;

  @override
  DiscountDto? get discount;
  @override
  List<CategoryDto>? get categories;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'specials')
  List<SpecialOfferDto>? get specials;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'popular_products')
  List<PopularProductDto>? get popularProducts;
  @override
  NotificationDto? get notification;
  @override
  CartDto? get cart;
  @override
  @JsonKey(ignore: true)
  _$$HomeDtoImplCopyWith<_$HomeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
