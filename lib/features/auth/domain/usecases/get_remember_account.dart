import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../repository/auth_repository.dart';

class GetRememberAccountUseCase extends UseCase<Map<String, dynamic>?, void> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  @override
  Future<Map<String, dynamic>?> call({void params}) async {
    return _repository.getRememberAccount();
  }
}
