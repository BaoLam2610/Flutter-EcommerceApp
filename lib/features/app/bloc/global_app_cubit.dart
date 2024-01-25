import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../configs/di/injection_container.dart';
import '../../../configs/themes/themes.dart';
import '../../../core/constants/constants.dart';
import '../../../utils/logger.dart';

part 'global_app_state.dart';

class GlobalAppCubit extends Cubit<GlobalAppState> {
  final SharedPreferences _prefs = sl.get<SharedPreferences>();
  late Future<void> Function(Locale locale) _contextSetLocale;

  GlobalAppCubit() : super(const GlobalAppState());

  ///Change app theme.
  void changeTheme() {
    _updateThemeSetting(!state.isDarkTheme);
    emit(state.copyWith(isDarkTheme: !state.isDarkTheme));
  }

  /// Update theme setting.
  void _updateThemeSetting(bool isDarkTheme) {
    AppThemeSetting.currentAppThemeType =
        isDarkTheme ? AppThemeType.dark : AppThemeType.light;
  }

  /// Init locale.
  /// Get locale from shared preferences if exist else get device locale.
  /// Note: you just can call it after Localization initialized.
  Future<void> initLocale({
    required Future<void> Function(Locale locale) contextSetLocale,
  }) async {
    try {
      _contextSetLocale = contextSetLocale;
      final Locale? locale = await _getLocaleFromSharedPreferences(_prefs);
      // If saved locale not null set it as current locale.
      if (locale != null) {
        emit(state.copyWith(currentLocale: locale));
        _contextSetLocale(locale);
        return;
      }
      // If saved locale null set device locale as current locale.
      // final deviceLocale =
      //     AppUtils.getLocaleFromLocaleName(Platform.localeName);
        emit(state.copyWith(currentLocale: AppLocalizations.vi));
        _contextSetLocale.call(AppLocalizations.vi);
    } catch (e) {
      Log.error(e.toString());
    }
  }

  void changeAppLocale(Locale locale) {
    if (locale.languageCode != state.currentLocale.languageCode ||
        locale.countryCode != state.currentLocale.countryCode) {
      _saveLocaleToSharedPreferences(
          _prefs, locale.languageCode, locale.countryCode);
      _contextSetLocale(locale);
      emit(state.copyWith(currentLocale: locale));
    }
  }

  /// Get language code from shared preferences.
  Future<Locale?> _getLocaleFromSharedPreferences(
      SharedPreferences prefs) async {
    String? languageCode;
    String? countryCode;
    try {
      languageCode = prefs.getString(AppStrings.currentLanguageCodeKey);
      countryCode = prefs.getString(AppStrings.currentCountryCodeKey);
    } catch (_) {}
    if (languageCode != null) {
      return Locale(languageCode, countryCode);
    }
    return null;
  }

  /// Save language code to shared preferences.
  /// Include: save language code and country code.
  void _saveLocaleToSharedPreferences(
    SharedPreferences prefs,
    String languageCode,
    String? countryCode,
  ) async {
    try {
      prefs.setString(AppStrings.currentLanguageCodeKey, languageCode);
      if (countryCode != null) {
        prefs.setString(AppStrings.currentCountryCodeKey, countryCode);
      }
    } catch (_) {}
  }
}
