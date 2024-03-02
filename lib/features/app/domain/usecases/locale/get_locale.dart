import 'dart:ui';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../repository/app_repository.dart';
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
