import '../../../../core/resources/api/data_response.dart';
import '../../data/dto/login_dto.dart';

abstract class AuthRepository {
  Future<DataResponse<LoginDto>> doLogin(
    String email,
    String password,
    String userType,
  );
}
