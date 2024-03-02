import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../domain/repository/auth_repository.dart';
import '../dto/login_request.dart';
import '../dto/register_request.dart';
import '../remote/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _apiService = inject.get<AuthService>();

  @override
  Future<dynamic> doLogin({required LoginRequest request}) {
    return _apiService.login(request);
  }

  @override
  Future<dynamic> doRegister({required RegisterRequest request}) {
    return _apiService.register(request);
  }

  @override
  Map<String, dynamic>? getRememberAccount() {
    return PrefUtil.instance.getObject(AppKeys.rememberAccount);
  }

  @override
  void saveAccessToken(String token) {
    PrefUtil.instance.setValue(AppKeys.accessToken, token);
  }

  @override
  void saveRememberAccount(Map<String, dynamic>? account) {
    if (account == null) {
      PrefUtil.instance.remove(AppKeys.rememberAccount);
      return;
    }
    PrefUtil.instance.setObject(
      AppKeys.rememberAccount,
      account,
    );
  }
}
