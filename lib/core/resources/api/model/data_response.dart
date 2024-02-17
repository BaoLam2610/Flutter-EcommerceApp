class BaseResponse {
  final dynamic error;
  final bool isSuccess;

  const BaseResponse({
    this.error,
    required this.isSuccess,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      isSuccess: json["isSuccess"],
      error: json["error"] ?? '',
    );
  }
}

class DataResponse extends BaseResponse {
  final dynamic data;

  DataResponse({
    this.data,
    super.error,
    required super.isSuccess,
  });

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      DataResponse(
        isSuccess: json["isSuccess"],
        error: json["error"] ?? '',
        data: json['data'],
      );

  @override
  String toString() {
    return 'DataResponse{isSuccess: ${super.isSuccess}, data: $data, error: ${super.error}';
  }
}
