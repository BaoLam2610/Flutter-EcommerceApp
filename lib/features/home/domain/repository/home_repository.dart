import '../../../../core/core.dart';

abstract class HomeRepository {
  Future<dynamic> getHomeData({required PagingData pagingData});
  Future<dynamic> getSellingProducts({required PagingData pagingData});
}
