import '../../../../core/resources/api/model/data_response.dart';
import '../../../../core/resources/data_state.dart';
import '../../data/dto/login_request.dart';
import '../../data/dto/register_request.dart';
import '../entities/login_info_entity.dart';

abstract class AuthRepository {
  Future<DataState<LoginInfoEntity>> doLogin({required LoginRequest request});
  Future<DataState<NoData>> doRegister({required RegisterRequest request});
  void saveAccessToken(String token);
  void saveRememberAccount(Map<String, dynamic>? account);
  Map<String, dynamic>? getRememberAccount();
}
