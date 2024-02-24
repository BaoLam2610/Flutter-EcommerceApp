import '../../../../configs/di/injection_container.dart';
import '../../../../core/bloc/bloc_state.dart';
import '../../../app/domain/usecases/use_case.dart';
import '../../data/dto/login_request.dart';
import '../entities/login_info_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase
    extends NetworkUseCase<LoginRequest, LoginInfoEntity> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  LoginUseCase();

  @override
  Future<Resource<LoginInfoEntity>> call({LoginRequest? params}) async {
    return handleApi(
      await _repository.doLogin(request: params!),
    );
  }
}
