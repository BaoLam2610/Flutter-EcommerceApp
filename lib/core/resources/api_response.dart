import 'package:equatable/equatable.dart';

class DataResponse<T> extends Equatable {
  final bool isSuccess;
  // final StatusCode statusCode;
  final String? error;
  final T? data;

  factory DataResponse.fromJson(Map<String, dynamic> map) {
    return DataResponse(
      isSuccess: map['isSuccess'] as bool,
      // statusCode: map['statusCode'] as StatusCode,
      error: map['error'] ??'',
      data: map['data']
    );
  }

  @override
  List<Object?> get props => [
        isSuccess,
        // statusCode,
        error,
      ];

  const DataResponse({
    required this.isSuccess,
    // required this.statusCode,
    required this.error,
    this.data,
  });
}

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
}
