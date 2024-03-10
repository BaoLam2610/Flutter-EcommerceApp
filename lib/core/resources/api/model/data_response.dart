class BaseResponse {
  final dynamic message;
  final bool isSuccess;

  const BaseResponse({
    this.message,
    required this.isSuccess,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      isSuccess: json['isSuccess'],
      message: json['message'] ?? '',
    );
  }
}

class DataResponse extends BaseResponse {
  final dynamic data;
  final PageResult? pageResult;

  DataResponse({
    this.data,
    this.pageResult,
    super.message,
    required super.isSuccess,
  });

  factory DataResponse.fromJson(
    dynamic json,
    Function(dynamic)? create,
  ) =>
      DataResponse(
        isSuccess: json['isSuccess'],
        message: json['message'] ?? '',
        data: create != null ? create(json['data']) : null,
        pageResult: json['pageResult'] != null
            ? PageResult.fromJson(json['pageResult'])
            : null,
      );
}

class PageResult {
  final int totalRecord;
  final int totalPage;
  final int currentPage;

  const PageResult({
    required this.totalRecord,
    required this.totalPage,
    required this.currentPage,
  });

  factory PageResult.fromJson(Map<String, dynamic> json) {
    return PageResult(
      totalRecord: json['totalRecord'] ?? 0,
      totalPage: json['totalPage'] ?? 1,
      currentPage: json['currentPage'] ?? 1,
    );
  }
}

class NoData {}
