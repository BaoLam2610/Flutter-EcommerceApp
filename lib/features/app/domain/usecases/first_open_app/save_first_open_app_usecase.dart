import '../../../../../configs/di/injection_container.dart';
import '../../repository/app_repository.dart';
import '../use_case.dart';

class SaveFirstOpenAppUseCase extends UseCase<void, void> {
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<void> call({void params}) async {
    return _repository.saveFirstOpenApp();
  }
}
