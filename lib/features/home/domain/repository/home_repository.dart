import '../models/home_data.dart';

abstract class HomeRepository {
  Future<HomeData> getHomeData();
}
