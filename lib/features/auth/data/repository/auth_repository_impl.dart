import '../../../../core/constants/constants.dart';
import '../../../../core/resources/api/api_list.dart';
import '../../../../core/resources/api/model/data_response.dart';
import '../../../../core/resources/api/rest_api_client.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/shared_preferences_util.dart';
import '../../domain/repository/auth_repository.dart';
import '../dto/login_info_dto.dart';
import '../dto/login_request.dart';
import '../dto/register_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestApiClient _apiService;

  const AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<LoginInfoDto>> doLogin({required LoginRequest request}) {
    return _apiService.post<LoginInfoDto>(
      ApiList.login,
      create: (json) => LoginInfoDto.fromJson(json),
      data: request.toJson(),
    );
  }

  @override
  Future<DataState<NoData>> doRegister({required RegisterRequest request}) {
    return _apiService.post<NoData>(
      ApiList.register,
      data: request.toJson(),
    );
  }

  @override
  bool getRememberAccount() {
    return SharedPreferencesUtil.instance.getBool(AppKeys.rememberAccount) ??
        false;
  }

  @override
  void saveAccessToken(String token) {
    SharedPreferencesUtil.instance.setValue(AppKeys.accessToken, token);
  }

  @override
  void saveRememberAccount(bool isRemember) {
    SharedPreferencesUtil.instance.setValue(
      AppKeys.rememberAccount,
      isRemember,
    );
  }
}
