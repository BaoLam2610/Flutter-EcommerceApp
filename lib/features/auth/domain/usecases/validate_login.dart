import '../../../../core/constants/constants.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/usecases/use_case.dart';
import '../models/user_login.dart';

class ValidateLoginUseCase extends UseCase<String, UserLogin> {
  @override
  Future<String> call({UserLogin? params}) async {
    if (params == null) return "";

    if (params.email.isEmpty) {
      return text_validate_enter.format(text_email.toLowerCase());
    }

    if (!emailValidatorRegExp.hasMatch(params.email)) {
      return text_validate_valid.format(text_email.toLowerCase());
    }

    if (params.password.isEmpty) {
      return text_validate_enter.format(text_password.toLowerCase());
    }

    return "";
  }
}
