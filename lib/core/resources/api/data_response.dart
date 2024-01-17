import 'status_code.dart';

class BaseResponse {
  final dynamic error;
  final bool isSuccess;
  final StatusCode statusCode;

  const BaseResponse({
    this.error,
    required this.isSuccess,
    required this.statusCode,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      isSuccess: json["isSuccess"],
      error: json["error"] ?? '',
      statusCode: StatusCode.fromJson(json['statusCode']),
    );
  }
}

class DataResponse<T> extends BaseResponse {
  final T? data;

  DataResponse({
    this.data,
    super.error,
    required super.isSuccess,
    required super.statusCode,
  });

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) =>
      DataResponse<T>(
        isSuccess: json["isSuccess"],
        error: json["error"] ?? '',
        statusCode: StatusCode.fromJson(json['statusCode']),
        data: create(json['data']),
      );
}
