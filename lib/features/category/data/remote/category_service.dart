import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../dto/category_dto.dart';

class CategoryService {
  final RestApiClient _restApiClient = inject.get<RestApiClient>();

  Future<DataResponse> getCategories() {
    return _restApiClient.get(
      EndPoint.category,
      create: (json) => castToList(json, (item) => CategoryDto.fromJson(item)),
    );
  }
}
