import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../auth/domain/usecases/get_remember_account.dart';

class AppStorage {
  String account = '';
  String password = '';

  final GetRememberAccountUseCase _getRememberAccountUseCase =
      inject.get<GetRememberAccountUseCase>();

  void init() {
    _initRememberAccount();
  }

  void _initRememberAccount() async {
    final rememberAccount = await _getRememberAccountUseCase.call();
    if (rememberAccount == null) {
      return;
    }
    account = (rememberAccount[AppKeys.email] as String?) ?? '';
    password = (rememberAccount[AppKeys.password] as String?) ?? '';
  }
}
