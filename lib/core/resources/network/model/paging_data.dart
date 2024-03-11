import '../../../core.dart';

class PagingData {
  final int pageSize;
  final int currentPage;

  const PagingData({
    required this.pageSize,
    required this.currentPage,
  });

  factory PagingData.deft() =>
      const PagingData(pageSize: AppConstants.defaultPageSize, currentPage: 1);

  Map<String, dynamic> toJson() {
    return {
      'pageSize': pageSize,
      'currentPage': currentPage,
    };
  }
}
