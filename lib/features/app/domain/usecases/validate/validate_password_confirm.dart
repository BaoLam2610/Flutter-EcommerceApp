import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../use_case.dart';

class ValidatePasswordConfirmUseCase
    extends UseCase<String, Map<String, dynamic>> {
  @override
  Future<String> call({Map<String, dynamic>? params}) async {
    final password = params![AppKeys.password] as String;
    final passwordConfirm = params[AppKeys.passwordConfirm] as String;
    final clickAction = params[AppKeys.clickAction] as bool;

    if (password.isNullOrEmpty) {
      return LocaleKeys.please_enter_password_first.tr();
    }

    if ((password != passwordConfirm) && clickAction) {
      return LocaleKeys.validate_password_not_match.tr();
    }

    return "";
  }
}
