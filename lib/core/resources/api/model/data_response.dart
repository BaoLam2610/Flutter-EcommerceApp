class BaseResponse {
  final dynamic message;
  final bool isSuccess;

  const BaseResponse({
    this.message,
    required this.isSuccess,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      isSuccess: json["isSuccess"],
      message: json["message"] ?? '',
    );
  }
}

class DataResponse extends BaseResponse {
  final dynamic data;

  DataResponse({
    this.data,
    super.message,
    required super.isSuccess,
  });

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>)? create,
  ) =>
      DataResponse(
        isSuccess: json["isSuccess"],
        message: json["message"] ?? '',
        data: create != null ? create(json['data']) : null,
      );
}

class NoData {

}
