import '../../../../core/core.dart';
import '../../../shared/shared.dart';

abstract class CategoryRepository {
  Future<DataResponse> getCategories();

  Future<DataResponse> getProductsCategories(ProductFilterRequest? request);
}
