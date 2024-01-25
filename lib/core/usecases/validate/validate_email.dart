import '../../constants/constants.dart';
import '../../constants/strings.dart';
import '../../extensions/string_extensions.dart';
import '../use_case.dart';

class ValidateEmailUseCase extends UseCase<String, String> {
  @override
  Future<String> call({String? params}) async {
    if (params.isNullOrEmpty()) {
      return text_validate_enter.format([text_email.toLowerCase()]);
    }

    // if (!emailValidatorRegExp.hasMatch(params!)) {
    //   return text_validate_valid.format([text_email.toLowerCase()]);
    // }

    return "";
  }
}
