import '../../../../core/resources/data_state.dart';
import '../../data/dto/login_request.dart';
import '../entities/login_info_entity.dart';

abstract class AuthRepository {
  Future<DataState<LoginInfoEntity>> doLogin({required LoginRequest request});
}
