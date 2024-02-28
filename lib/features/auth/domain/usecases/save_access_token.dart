import '../../../../configs/di/injection_container.dart';
import '../../../app/domain/usecases/use_case.dart';
import '../repository/auth_repository.dart';

class SaveAccessTokenUseCase extends UseCase<void, String> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  @override
  Future<void> call({String? params}) async {
    return _repository.saveAccessToken(params ?? '');
  }
}
