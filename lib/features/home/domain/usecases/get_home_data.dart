import '../../../../core/usecases/use_case.dart';
import '../models/home_data.dart';
import '../repository/home_repository.dart';

class GetHomeDataUseCase extends UseCase<HomeData, void> {
  final HomeRepository homeRepository;

  GetHomeDataUseCase(this.homeRepository);

  @override
  Future<HomeData> call({void params}) {
    return homeRepository.getHomeData();
  }
}
