import 'package:freezed_annotation/freezed_annotation.dart';

import '../cart/cart_dto.dart';
import '../category/category_dto.dart';
import '../discount/discount_dto.dart';
import '../notification/notification_dto.dart';
import '../popular_product/popular_product_dto.dart';
import '../special_offer/special_dto.dart';

part 'home_dto.freezed.dart';
part 'home_dto.g.dart';

@freezed
class HomeDto with _$HomeDto {
  factory HomeDto(
    DiscountDto? discount,
    List<CategoryDto>? categories,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'specials') List<SpecialOfferDto>? specials,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'popular_products') List<PopularProductDto>? popularProducts,
    NotificationDto? notification,
    CartDto? cart,
  ) = _HomeDto;

  factory HomeDto.fromJson(Map<String, dynamic> json) =>
      _$HomeDtoFromJson(json);
}
