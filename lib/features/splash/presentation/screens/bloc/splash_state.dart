part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final Resource status;
  final bool isLogoVisible;
  final bool isFirstOpenApp;
  final bool isLogged;
  final String nextRoute;

  const SplashState({
    required this.status,
    this.isLogoVisible = false,
    this.isFirstOpenApp = false,
    this.isLogged = false,
    this.nextRoute = '',
  });

  @override
  List<Object> get props => [
        status,
        isLogoVisible,
        isFirstOpenApp,
        isLogged,
        nextRoute,
      ];

  SplashState copyWith({
    Resource? status,
    bool? isLogoVisible,
    bool? isFirstOpenApp,
    bool? isLogged,
    String? nextRoute,
  }) {
    return SplashState(
      status: status ?? this.status,
      isLogoVisible: isLogoVisible ?? this.isLogoVisible,
      isFirstOpenApp: isFirstOpenApp ?? this.isFirstOpenApp,
      isLogged: isLogged ?? this.isLogged,
      nextRoute: nextRoute ?? this.nextRoute,
    );
  }
}
