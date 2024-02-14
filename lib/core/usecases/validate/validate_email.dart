import 'package:easy_localization/easy_localization.dart';

import '../../../gen/locale_keys.g.dart';
import '../../constants/constants.dart';
import '../../constants/strings.dart';
import '../../extensions/string_extensions.dart';
import '../use_case.dart';

class ValidateEmailUseCase extends UseCase<String, String> {
  @override
  Future<String> call({String? params}) async {
    if (params.isNullOrEmpty) {
      return LocaleKeys.validate_enter.tr().format([
        LocaleKeys.email.tr().toLowerCase(),
      ]);
    }

    if (!emailValidatorRegExp.hasMatch(params!)) {
      return LocaleKeys.validate_valid.tr().format([
        LocaleKeys.email.tr().toLowerCase(),
      ]);
    }

    return "";
  }
}
