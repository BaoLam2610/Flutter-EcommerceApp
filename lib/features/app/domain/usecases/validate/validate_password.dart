import '../../../../../core/extensions/string_extensions.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../use_case.dart';

class ValidatePasswordUseCase extends UseCase<String, String> {
  @override
  Future<String> call({String? params}) async {
    if (params.isNullOrEmpty) {
      return LocaleKeys.validate_enter_password;
    }

    /*
    * You can add handle password by length
    * */

    return "";
  }
}
