import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../entities/home_entity.dart';
import '../repository/home_repository.dart';

class GetHomeDataUseCase extends NetworkUseCase<PagingData, HomeEntity> {
  final HomeRepository _repository = inject.get<HomeRepository>();

  @override
  Future<Resource<HomeEntity>> call({PagingData? params}) async {
    return handleApi(await _repository.getHomeData(pagingData: params!));
  }
}
