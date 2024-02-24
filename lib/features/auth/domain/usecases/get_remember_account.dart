import '../../../../configs/di/injection_container.dart';
import '../../../app/domain/usecases/use_case.dart';
import '../repository/auth_repository.dart';

class GetRememberAccountUseCase extends UseCase<Map<String, dynamic>?, void> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  GetRememberAccountUseCase();

  @override
  Future<Map<String, dynamic>?> call({void params}) async {
    return _repository.getRememberAccount();
  }
}
