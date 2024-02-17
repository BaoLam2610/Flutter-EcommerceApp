import '../../../../core/resources/api/api_list.dart';
import '../../../../core/resources/api/rest_api_client.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/auth_repository.dart';
import '../dto/login_info_dto.dart';
import '../dto/login_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestApiClient _apiService;

  const AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<LoginInfoDto>> doLogin({required LoginRequest request}) {
    return _apiService.get<LoginInfoDto>(
      ApiList.login,
      create: (json) => LoginInfoDto.fromJson(json),
      queryParameters: request.toJson(),
    );
  }
}
