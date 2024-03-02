import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../app/domain/repository/app_repository.dart';

class GetFirstOpenAppUseCase extends UseCase<bool, void> {
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<bool> call({void params}) async {
    return _repository.getFirstOpenApp();
  }
}
