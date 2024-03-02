import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../app/domain/repository/app_repository.dart';

class SaveFirstOpenAppUseCase extends UseCase<void, void> {
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<void> call({void params}) async {
    return _repository.saveFirstOpenApp();
  }
}
