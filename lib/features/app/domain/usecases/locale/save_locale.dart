import '../../../../../configs/di/injection_container.dart';
import '../../repository/app_repository.dart';
import '../use_case.dart';

class SaveLocaleUseCase extends UseCase<void, Map<String, dynamic>> {
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<void> call({Map<String, dynamic>? params}) async {
    return _repository.saveLocale(params!);
  }
}
