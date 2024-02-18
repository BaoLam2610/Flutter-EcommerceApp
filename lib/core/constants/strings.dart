// ignore_for_file: constant_identifier_names
class AppStrings {
  const AppStrings._();

  static const String currentLanguageCodeKey = 'current_language';
  static const String currentCountryCodeKey = 'current_country';

  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
