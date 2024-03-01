import 'dart:ui';

import '../../../../../configs/di/injection_container.dart';
import '../../../../../core/constants/constants.dart';
import '../../repository/app_repository.dart';
import '../use_case.dart';
import 'get_device_locale.dart';

class GetLocaleUseCase extends UseCase<Locale, void> {
  final GetDeviceLocaleUseCase _getDeviceLocaleUseCase =
      inject.get<GetDeviceLocaleUseCase>();
  final AppRepository _repository = inject.get<AppRepository>();

  @override
  Future<Locale> call({void params}) async {
    final localLocale = _repository.getLocale();
    if (localLocale == null) {
      return _getDeviceLocaleUseCase.call();
    }
    String languageCode = localLocale[AppKeys.languageCode];
    String countryCode = localLocale[AppKeys.countryCode];
    return Locale(languageCode, countryCode);
  }
}