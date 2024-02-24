import '../../../../core/constants/constants.dart';
import '../../../../core/utils/shared_preferences_util.dart';
import '../../domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  @override
  bool getFirstOpenApp() {
    return SharedPreferencesUtil.instance.getBool(AppKeys.firstOpenApp) ??
        true;
  }

  @override
  void saveFirstOpenApp() {
    SharedPreferencesUtil.instance.setValue(AppKeys.firstOpenApp, false);
  }
}
