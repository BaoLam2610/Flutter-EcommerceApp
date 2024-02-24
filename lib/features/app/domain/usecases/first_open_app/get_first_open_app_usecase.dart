import '../../../../../configs/di/injection_container.dart';
import '../../repository/app_repository.dart';
import '../use_case.dart';

class GetFirstOpenAppUseCase extends UseCase<bool, void> {
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<bool> call({void params}) async {
    return _repository.getFirstOpenApp();
  }
}
