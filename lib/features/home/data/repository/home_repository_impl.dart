import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../domain/repository/home_repository.dart';
import '../remote/home_service.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeService _service = inject.get<HomeService>();

  @override
  Future<DataResponse> getHomeData({required PagingData pagingData}) {
    return _service.getHomeData(pagingData);
  }

  @override
  Future<DataResponse> getSellingProducts({required PagingData pagingData}) {
    return _service.getSellingProducts(pagingData);
  }
}