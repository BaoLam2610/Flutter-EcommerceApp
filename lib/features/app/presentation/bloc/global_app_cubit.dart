import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../../utils/utils.dart';
import '../../domain/usecases/locale/get_locale.dart';
import '../../domain/usecases/locale/save_locale.dart';

part 'global_app_state.dart';

class GlobalAppCubit extends Cubit<GlobalAppState> {
  final GetLocaleUseCase _getLocaleUseCase = inject.get<GetLocaleUseCase>();
  final SaveLocaleUseCase _saveLocaleUseCase = inject.get<SaveLocaleUseCase>();

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
      final Locale locale = await _getLocaleUseCase.call();
      emit(state.copyWith(currentLocale: locale));
      _contextSetLocale(locale);
    } catch (e) {
      Log.error(e.toString());
    }
  }

  void changeAppLocale(Locale locale) {
    _saveLocaleUseCase.call(params: {
      AppKeys.languageCode: locale.languageCode,
      AppKeys.countryCode: locale.countryCode,
    });
    _contextSetLocale(locale);
    emit(state.copyWith(currentLocale: locale));
  }

  void onChangeLocale() async {
    if (isViLocale) {
      changeAppLocale(AppLocalizations.en);
      return;
    }
    changeAppLocale(AppLocalizations.vi);
  }

  bool get isViLocale =>
      state.currentLocale.languageCode == AppLocalizations.vi.languageCode &&
      state.currentLocale.countryCode == AppLocalizations.vi.countryCode;
}
