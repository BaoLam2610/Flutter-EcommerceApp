import 'package:easy_localization/easy_localization.dart';

import '../../../../../gen/locale_keys.g.dart';
import '../../../../../core/extensions/string_extensions.dart';
import '../use_case.dart';

class ValidatePasswordUseCase extends UseCase<String, String> {
  @override
  Future<String> call({String? params}) async {
    if (params.isNullOrEmpty) {
      return LocaleKeys.validate_enter.tr(args: [
        LocaleKeys.password.tr().toLowerCase(),
      ]);
    }

    /*
    * You can add handle password by length
    * */

    return "";
  }
}
