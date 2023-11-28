import '../../domain/models/home_data.dart';
import '../../domain/repository/home_repository.dart';
import '../local/demo_data.dart';
import '../mappers/home_data_mapper.dart';
import '../remote/dto/home/home_dto.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<HomeData> getHomeData() async {
    return HomeDto.fromJson(homeJson).toDomain;
  }
}
