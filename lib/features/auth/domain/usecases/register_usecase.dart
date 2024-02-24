import '../../../../configs/di/injection_container.dart';
import '../../../../core/resources/data_state.dart';
import '../../../app/domain/usecases/use_case.dart';
import '../../data/dto/register_request.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase extends UseCase<DataState, RegisterRequest> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  RegisterUseCase();

  @override
  Future<DataState> call({RegisterRequest? params}) {
    return _repository.doRegister(request: params!);
  }
}
