import '../../../../core/core.dart';
import '../../domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  @override
  bool getFirstOpenApp() {
    return PrefUtil.instance.getBool(AppKeys.firstOpenApp) ?? true;
  }

  @override
  void saveFirstOpenApp() {
    PrefUtil.instance.setValue(AppKeys.firstOpenApp, false);
  }

  @override
  Map<String, dynamic>? getLocale() {
    return PrefUtil.instance.getObject(AppKeys.currentLocale);
  }

  @override
  void saveLocale(Map<String, dynamic> locale) {
    PrefUtil.instance.setObject(AppKeys.currentLocale, locale);
  }

  @override
  bool getLogged() {
    return PrefUtil.instance.getBool(AppKeys.isLogged) ?? false;
  }

  @override
  void saveLogged() {
    PrefUtil.instance.setValue(AppKeys.isLogged, true);
  }
}
