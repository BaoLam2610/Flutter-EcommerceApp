import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../dto/home_dto.dart';
import '../dto/product_dto.dart';

class HomeService {
  final RestApiClient _apiService = inject.get<RestApiClient>();

  Future<dynamic> getHomeData(PagingData pagingData) {
    return _apiService.get<HomeDto>(
      ApiList.home,
      create: (json) => HomeDto.fromJson(json),
      queryParameters: pagingData.toJson(),
    );
  }

  Future<dynamic> getSellingProducts(PagingData pagingData) {
    return _apiService.get<List<ProductDto>>(
      ApiList.product,
      create: (json) => castToList(json, (item) => ProductDto.fromJson(item)),
      queryParameters: pagingData.toJson(),
    );
  }
}
