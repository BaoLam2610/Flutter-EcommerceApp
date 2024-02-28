import '../../data/dto/login_request.dart';
import '../../data/dto/register_request.dart';

abstract class AuthRepository {
  Future<dynamic> doLogin({required LoginRequest request});

  Future<dynamic> doRegister({required RegisterRequest request});

  void saveAccessToken(String token);

  void saveRememberAccount(Map<String, dynamic>? account);

  Map<String, dynamic>? getRememberAccount();
}
