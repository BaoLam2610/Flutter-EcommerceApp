import '../../../../configs/configs.dart';
import '../../../../core/resources/network/model/data_response.dart';
import '../../domain/repository/category_repository.dart';
import '../remote/category_service.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryService _apiService = inject.get<CategoryService>();

  @override
  Future<DataResponse> getCategories() {
    return _apiService.getCategories();
  }
}