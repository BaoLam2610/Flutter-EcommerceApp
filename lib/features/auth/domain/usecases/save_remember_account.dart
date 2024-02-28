import '../../../../configs/di/injection_container.dart';
import '../../../app/domain/usecases/use_case.dart';
import '../repository/auth_repository.dart';

class SaveRememberAccountUseCase extends UseCase<void, Map<String, String>> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  @override
  Future<void> call({Map<String, String>? params}) async {
    return _repository.saveRememberAccount(params);
  }
}
