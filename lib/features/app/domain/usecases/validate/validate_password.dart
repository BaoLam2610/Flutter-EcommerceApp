import '../../../../../core/core.dart';
import '../../../../../gen/gen.dart';

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
