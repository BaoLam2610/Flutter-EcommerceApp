import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../data/dto/login_request.dart';
import '../entities/login_info_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase extends NetworkUseCase<LoginRequest, LoginInfoEntity> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  @override
  Future<Resource<LoginInfoEntity>> call({LoginRequest? params}) async {
    return handleApi(
      await _repository.doLogin(request: params!),
    );
  }
}
