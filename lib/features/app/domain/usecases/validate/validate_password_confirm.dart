import '../../../../../core/core.dart';
import '../../../../../gen/gen.dart';

class ValidatePasswordConfirmUseCase
    extends UseCase<String, Map<String, dynamic>> {
  @override
  Future<String> call({Map<String, dynamic>? params}) async {
    final password = params![AppKeys.password] as String;
    final passwordConfirm = params[AppKeys.passwordConfirm] as String;
    final clickAction = params[AppKeys.clickAction] as bool;

    if (password.isNullOrEmpty) {
      return LocaleKeys.please_enter_password_first;
    }

    if ((password != passwordConfirm) && clickAction) {
      return LocaleKeys.validate_password_not_match;
    }

    return "";
  }
}
