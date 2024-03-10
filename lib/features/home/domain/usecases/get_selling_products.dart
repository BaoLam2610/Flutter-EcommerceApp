import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../entities/product_entity.dart';
import '../repository/home_repository.dart';

class GetSellingProductsUseCase
    extends NetworkUseCase<PagingData, List<ProductEntity>> {
  final HomeRepository _repository = inject.get<HomeRepository>();

  @override
  Future<Resource<List<ProductEntity>>> call({PagingData? params}) async {
    return handleApi(_repository.getSellingProducts(pagingData: params!));
  }
}
