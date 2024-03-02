import '../../../../configs/di/injection_container.dart';
import '../../../app/domain/repository/app_repository.dart';
import '../../../app/domain/usecases/use_case.dart';

class SaveLoggedUseCase extends UseCase<void, void> {
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<void> call({void params}) async {
    _repository.saveLogged();
  }
}
