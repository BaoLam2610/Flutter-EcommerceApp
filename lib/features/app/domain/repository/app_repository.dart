abstract class AppRepository {
  void saveFirstOpenApp();

  bool getFirstOpenApp();

  void saveLocale(Map<String, dynamic> locale);

  Map<String, dynamic>? getLocale();
}
