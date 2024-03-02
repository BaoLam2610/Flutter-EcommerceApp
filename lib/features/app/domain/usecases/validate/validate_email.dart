import '../../../../../core/core.dart';
import '../../../../../gen/gen.dart';

class ValidateEmailUseCase extends UseCase<String, String> {
  @override
  Future<String> call({String? params}) async {
    if (params.isNullOrEmpty) {
      return LocaleKeys.validate_enter_email;
    }

    if (!AppStrings.emailValidatorRegExp.hasMatch(params!)) {
      return LocaleKeys.validate_valid_email;
    }

    return "";
  }
}
