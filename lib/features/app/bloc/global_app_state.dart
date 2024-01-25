part of 'global_app_cubit.dart';

class GlobalAppState extends Equatable {
  final bool isDarkTheme;
  final Locale currentLocale;

  const GlobalAppState({
    this.isDarkTheme = false,
    this.currentLocale = AppLocalizations.vi,
  });

  @override
  List<Object?> get props => [isDarkTheme, currentLocale];

  GlobalAppState copyWith({
    bool? isDarkTheme,
    Locale? currentLocale,
  }) {
    return GlobalAppState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      currentLocale: currentLocale ?? this.currentLocale,
    );
  }
}
