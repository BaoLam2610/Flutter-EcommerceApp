import '../../../../core/core.dart';

abstract class HomeRepository {
  Future<DataResponse> getHomeData({required PagingData pagingData});
  Future<DataResponse> getSellingProducts({required PagingData pagingData});
}
