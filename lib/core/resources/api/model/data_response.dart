class BaseResponse {
  final dynamic error;
  final String? message;
  final bool isSuccess;

  const BaseResponse({
    this.error,
    this.message,
    required this.isSuccess,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      isSuccess: json["isSuccess"],
      message: json['message'],
      error: json["error"] ?? '',
    );
  }
}

class DataResponse extends BaseResponse {
  final dynamic data;

  DataResponse({
    this.data,
    super.error,
    super.message,
    required super.isSuccess,
  });

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>)? create,
  ) =>
      DataResponse(
        isSuccess: json["isSuccess"],
        message: json['message'],
        error: json["error"] ?? '',
        data: create != null ? create(json['data']) : null,
      );
}

class NoData {

}
