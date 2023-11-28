import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_product_dto.freezed.dart';
part 'popular_product_dto.g.dart';

@freezed
class PopularProductDto with _$PopularProductDto {

  factory PopularProductDto(
    String? id,
    String? name,
    String? image,
    double? price,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'is_favorite')
    bool? isFavorite,
  ) = _PopularProductDto;

  factory PopularProductDto.fromJson(Map<String, dynamic> json) => _$PopularProductDtoFromJson(json);
}