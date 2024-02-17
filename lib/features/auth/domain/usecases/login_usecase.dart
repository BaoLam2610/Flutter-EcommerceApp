import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/dto/login_request.dart';
import '../repository/auth_repository.dart';

class LoginUseCase extends UseCase<DataState, LoginRequest> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<DataState> call({LoginRequest? params}) {
    return _repository.doLogin(request: params!);
  }
}
