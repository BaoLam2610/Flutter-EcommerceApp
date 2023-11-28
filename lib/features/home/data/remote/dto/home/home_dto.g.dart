// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeDtoImpl _$$HomeDtoImplFromJson(Map<String, dynamic> json) =>
    _$HomeDtoImpl(
      json['discount'] == null
          ? null
          : DiscountDto.fromJson(json['discount'] as Map<String, dynamic>),
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['specials'] as List<dynamic>?)
          ?.map((e) => SpecialOfferDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['popular_products'] as List<dynamic>?)
          ?.map((e) => PopularProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['notification'] == null
          ? null
          : NotificationDto.fromJson(
              json['notification'] as Map<String, dynamic>),
      json['cart'] == null
          ? null
          : CartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HomeDtoImplToJson(_$HomeDtoImpl instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'categories': instance.categories,
      'specials': instance.specials,
      'popular_products': instance.popularProducts,
      'notification': instance.notification,
      'cart': instance.cart,
    };
