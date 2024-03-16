import '../../../../core/core.dart';

abstract class CategoryRepository {
  Future<DataResponse> getCategories();
}
