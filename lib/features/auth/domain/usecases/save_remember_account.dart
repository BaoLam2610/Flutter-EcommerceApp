import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../repository/auth_repository.dart';

class SaveRememberAccountUseCase extends UseCase<void, Map<String, String>> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  @override
  Future<void> call({Map<String, String>? params}) async {
    return _repository.saveRememberAccount(params);
  }
}
