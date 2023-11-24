import '../../../../core/constants/strings.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/usecases/use_case.dart';
import '../../../../core/usecases/validate/validate_email.dart';
import '../models/register/user_register.dart';

class ValidateRegisterUseCase extends UseCase<String, UserRegister> {
  final ValidateEmailUseCase _validateEmailUseCase;

  ValidateRegisterUseCase(
    this._validateEmailUseCase,
  );

  @override
  Future<String> call({UserRegister? params}) async {
    if (params == null) return "";

    final emailValidateResult =
        await _validateEmailUseCase.call(params: params.email);

    if (emailValidateResult.isNotEmpty) {
      return emailValidateResult;
    }

    if (params.password.isEmpty) {
      return text_validate_enter.format([text_password.toLowerCase()]);
    }

    if (params.password.length <= 2) {
      return text_validate_length.format([text_password, 2]);
    }

    if (params.confirmPassword != params.password) {
      return text_validate_password_not_match;
    }

    if (params.profile == null) return "";

    if (params.profile!.fullName.isEmpty) {
      return text_validate_enter.format([text_full_name.toLowerCase()]);
    }

    if (params.profile!.phoneNumber.isEmpty) {
      return text_validate_enter.format([text_phone_number.toLowerCase()]);
    }

    return "";
  }
}
