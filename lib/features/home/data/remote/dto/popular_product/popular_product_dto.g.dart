// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PopularProductDtoImpl _$$PopularProductDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularProductDtoImpl(
      json['id'] as String?,
      json['name'] as String?,
      json['image'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['is_favorite'] as bool?,
    );

Map<String, dynamic> _$$PopularProductDtoImplToJson(
        _$PopularProductDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'is_favorite': instance.isFavorite,
    };
