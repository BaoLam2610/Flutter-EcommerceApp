import 'package:freezed_annotation/freezed_annotation.dart';

part 'special_dto.freezed.dart';
part 'special_dto.g.dart';

@freezed
class SpecialOfferDto with _$SpecialOfferDto {
  factory SpecialOfferDto(
    String? id,
    String? title,
    String? image,
    int? totalBrands,
  ) = _SpecialOfferDto;

  factory SpecialOfferDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferDtoFromJson(json);
}
