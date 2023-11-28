import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_dto.freezed.dart';
part 'discount_dto.g.dart';

@freezed
class DiscountDto with _$DiscountDto {
  factory DiscountDto(
    String? id,
    String? title,
    String? description,
    String? image,
  ) = _DiscountDto;

  factory DiscountDto.fromJson(Map<String, dynamic> json) =>
      _$DiscountDtoFromJson(json);
}
