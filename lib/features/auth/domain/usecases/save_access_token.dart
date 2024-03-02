import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../repository/auth_repository.dart';

class SaveAccessTokenUseCase extends UseCase<void, String> {
  final AuthRepository _repository = inject.get<AuthRepository>();

  @override
  Future<void> call({String? params}) async {
    return _repository.saveAccessToken(params ?? '');
  }
}
