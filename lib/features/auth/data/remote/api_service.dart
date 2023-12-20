import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/resources/api/data_response.dart';
import '../../../../utils/api_list.dart';
import '../dto/login_dto.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @GET('login')
  Future<DataResponse<LoginDto>> doLogin({
    @Query('email') required String email,
    @Query('password') required String password,
    @Query('userType') required String userType,
  });
}
