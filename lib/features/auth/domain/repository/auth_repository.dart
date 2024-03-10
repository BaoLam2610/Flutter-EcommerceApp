import '../../../../core/core.dart';
import '../../data/dto/login_request.dart';
import '../../data/dto/register_request.dart';

abstract class AuthRepository {
  Future<DataResponse> doLogin({required LoginRequest request});

  Future<DataResponse> doRegister({required RegisterRequest request});

  void saveAccessToken(String token);

  void saveRememberAccount(Map<String, dynamic>? account);

  Map<String, dynamic>? getRememberAccount();
}
