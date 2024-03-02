import '../../../../core/constants/constants.dart';
import '../../../../core/utils/shared_preferences_util.dart';
import '../../domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  @override
  bool getFirstOpenApp() {
    return SharedPreferencesUtil.instance.getBool(AppKeys.firstOpenApp) ?? true;
  }

  @override
  void saveFirstOpenApp() {
    SharedPreferencesUtil.instance.setValue(AppKeys.firstOpenApp, false);
  }

  @override
  Map<String, dynamic>? getLocale() {
    return SharedPreferencesUtil.instance.getObject(AppKeys.currentLocale);
  }

  @override
  void saveLocale(Map<String, dynamic> locale) {
    SharedPreferencesUtil.instance.setObject(AppKeys.currentLocale, locale);
  }

  @override
  bool getLogged() {
    return SharedPreferencesUtil.instance.getBool(AppKeys.isLogged) ?? false;
  }

  @override
  void saveLogged() {
    SharedPreferencesUtil.instance.setValue(AppKeys.isLogged, false);
  }
}
