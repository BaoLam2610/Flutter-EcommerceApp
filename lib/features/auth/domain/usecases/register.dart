import '../../../../configs/di/injection_container.dart';
import '../../../../core/bloc/bloc_state.dart';
import '../../../../core/resources/api/model/data_response.dart';
import '../../../app/domain/usecases/use_case.dart';
import '../../data/dto/register_request.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase extends NetworkUseCase<RegisterRequest, NoData> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  @override
  Future<Resource<NoData>> call({RegisterRequest? params}) async {
    return handleApi(await _repository.doRegister(request: params!));
  }
}
