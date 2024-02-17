import '../../../../core/resources/data_state.dart';
import '../../data/dto/login_request.dart';

abstract class AuthRepository {
  Future<DataState> doLogin({required LoginRequest request});
}
