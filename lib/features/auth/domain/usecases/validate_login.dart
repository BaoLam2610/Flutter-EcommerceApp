import '../../../../core/constants/strings.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/usecases/use_case.dart';
import '../../../../core/usecases/validate/validate_email.dart';
import '../models/login/user_login.dart';

class ValidateLoginUseCase extends UseCase<String, UserLogin> {
  final ValidateEmailUseCase _validateEmailUseCase;

  ValidateLoginUseCase(this._validateEmailUseCase);

  @override
  Future<String> call({UserLogin? params}) async {
    if (params == null) return "";

    final emailValidateResult =
        await _validateEmailUseCase.call(params: params.email);

    if (emailValidateResult.isNotEmpty) {
      return emailValidateResult;
    }

    if (params.password.isEmpty) {
      return text_validate_enter.format([text_password.toLowerCase()]);
    }

    return "";
  }
}
