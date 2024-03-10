import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../dto/home_dto.dart';
import '../dto/product_dto.dart';

class HomeService {
  final RestApiClient _apiService = inject.get<RestApiClient>();

  Future<DataResponse> getHomeData(PagingData pagingData) {
    return _apiService.get(
      ApiList.home,
      create: (json) => HomeDto.fromJson(json),
      queryParameters: pagingData.toJson(),
    );
  }

  Future<DataResponse> getSellingProducts(PagingData pagingData) {
    return _apiService.get(
      ApiList.product,
      create: (json) => castToList(json, (item) => ProductDto.fromJson(item)),
      queryParameters: pagingData.toJson(),
    );
  }
}
