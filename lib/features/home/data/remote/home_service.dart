import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../dto/home_dto.dart';

class HomeService {
  final RestApiClient _apiService = inject.get<RestApiClient>();

  Future<dynamic> getHomeData(PagingData pagingData) {
    return _apiService.get<HomeDto>(
      ApiList.home,
      create: (json) => HomeDto.fromJson(json),
      queryParameters: pagingData.toJson(),
    );
  }
}
