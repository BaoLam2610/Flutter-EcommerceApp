import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_dto.freezed.dart';
part 'cart_dto.g.dart';

@freezed
class CartDto with _$CartDto {
  factory CartDto(
    String? id,
    int? total,
  ) = _CartDto;

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);
}
