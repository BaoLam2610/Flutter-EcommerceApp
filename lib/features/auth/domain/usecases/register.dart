import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../data/dto/register_request.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase extends NetworkUseCase<RegisterRequest, NoData> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  @override
  Future<Resource<NoData>> call({RegisterRequest? params}) async {
    return handleApi(await _repository.doRegister(request: params!));
  }
}
