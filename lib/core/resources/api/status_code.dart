
class StatusCode {
  final int value;
  final String description;

  const StatusCode({
    required this.value,
    required this.description,
  });



  factory StatusCode.fromJson(Map<String, dynamic> map) {
    return StatusCode(
      value: map['value'] as int,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'description': description,
    };
  }
}

//
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'status_code.freezed.dart';
// part 'status_code.g.dart';
//
// @freezed
// class StatusCode with _$StatusCode {
//   const factory StatusCode({
//     int? code,
//     String? description,
//   }) = _StatusCode;
//
//   factory StatusCode.fromJson(Map<String, dynamic> json) =>
//       _$StatusCodeFromJson(json);
// }

