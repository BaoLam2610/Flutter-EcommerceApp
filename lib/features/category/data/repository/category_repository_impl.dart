import '../../../../configs/configs.dart';
import '../../../../core/resources/network/model/data_response.dart';
import '../../../shared/data/dto/product_filter_request.dart';
import '../../domain/repository/category_repository.dart';
import '../remote/category_service.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryService _apiService = inject.get<CategoryService>();

  @override
  Future<DataResponse> getCategories() {
    return _apiService.getCategories();
  }

  @override
  Future<DataResponse> getProductsCategories(ProductFilterRequest? request) {
    return _apiService.getProductsByCategory(request);
  }

}