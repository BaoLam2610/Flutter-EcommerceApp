import '../../../../configs/di/injection_container.dart';
import '../../../../core/resources/api/api_list.dart';
import '../../../../core/resources/api/model/data_response.dart';
import '../../../../core/resources/api/rest_api_client.dart';
import '../dto/login_info_dto.dart';
import '../dto/login_request.dart';
import '../dto/register_request.dart';

class AuthService {
  final RestApiClient _apiService = inject.get<RestApiClient>();

  Future<dynamic> login(LoginRequest request) {
    return _apiService.post<LoginInfoDto>(
      ApiList.login,
      create: (json) => LoginInfoDto.fromJson(json),
      data: request.toJson(),
    );
  }

  Future<dynamic> register(RegisterRequest request) {
    return _apiService.post<NoData>(
      ApiList.register,
      data: request.toJson(),
    );
  }
}
