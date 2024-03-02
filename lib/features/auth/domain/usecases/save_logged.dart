import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../app/domain/repository/app_repository.dart';

class SaveLoggedUseCase extends UseCase<void, void> {
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<void> call({void params}) async {
    _repository.saveLogged();
  }
}
