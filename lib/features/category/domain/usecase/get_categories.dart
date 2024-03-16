import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../enities/category_entity.dart';
import '../repository/category_repository.dart';

class GetCategoriesUseCase extends NetworkUseCase<void, List<CategoryEntity>> {
  final _repository = inject.get<CategoryRepository>();

  @override
  Future<Resource<List<CategoryEntity>>> call({void params}) {
    return handleApi(_repository.getCategories());
  }
}
