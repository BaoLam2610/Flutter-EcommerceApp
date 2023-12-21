import '../../../../core/resources/api/data_response.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/dto/login_dto.dart';
import '../models/login/user_login.dart';
import '../repository/auth_repository.dart';

class LoginUseCase
    extends UseCase<DataResponse<LoginDto>, UserLogin> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<DataResponse<LoginDto>> call({UserLogin? params}) {
    return _repository.doLogin(
      params!.email,
      params.password,
      'user'//params['userType']!,
    );
  }
}
