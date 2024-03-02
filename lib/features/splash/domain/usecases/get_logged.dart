import '../../../../configs/di/injection_container.dart';
import '../../../app/domain/repository/app_repository.dart';
import '../../../app/domain/usecases/use_case.dart';

class GetLoggedUseCase extends UseCase<bool, void> {
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<bool> call({void params}) async {
    return _repository.getLogged();
  }
}
