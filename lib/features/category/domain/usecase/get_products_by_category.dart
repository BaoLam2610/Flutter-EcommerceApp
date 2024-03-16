import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../repository/category_repository.dart';

class GetProductsByCategoryUseCase
    extends NetworkUseCase<ProductFilterRequest, List<ProductEntity>> {
  final _repository = inject.get<CategoryRepository>();

  @override
  Future<Resource<List<ProductEntity>>> call({ProductFilterRequest? params}) {
    return handleApi(_repository.getProductsCategories(params));
  }
}
