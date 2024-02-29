import 'dart:io';
import 'dart:ui';

import '../use_case.dart';

class GetDeviceLocaleUseCase extends UseCase<Locale, void> {
  @override
  Future<Locale> call({void params}) async {
    final localeName = Platform.localeName;
    final locale = localeName.split('_');
    if (locale.length == 1) {
      return Locale(locale[0]);
    }
    return Locale(locale[0], locale[1]);
  }
}
