import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../use_case.dart';

class ValidateEmailUseCase extends UseCase<String, String> {
  @override
  Future<String> call({String? params}) async {
    if (params.isNullOrEmpty) {
      return LocaleKeys.validate_enter.tr(args: [
        LocaleKeys.email.tr().toLowerCase(),
      ]);
    }

    if (!AppStrings.emailValidatorRegExp.hasMatch(params!)) {
      return LocaleKeys.validate_valid.tr(args: [
        LocaleKeys.email.tr().toLowerCase(),
      ]);
    }

    return "";
  }
}
