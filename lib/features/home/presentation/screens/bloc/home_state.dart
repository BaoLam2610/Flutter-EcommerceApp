part of 'home_cubit.dart';

class HomeState extends BaseState {
  final int cartBadgeCount;
  final int bannerCurrentIndex;

  const HomeState({
    required super.status,
    this.cartBadgeCount = 0,
    this.bannerCurrentIndex = 0,
  });

  @override
  List<Object> get props => [
        cartBadgeCount,
        bannerCurrentIndex,
        status,
      ];

  @override
  HomeState copyWith({
    Resource? status,
    int? cartBadgeCount,
    int? bannerCurrentIndex,
  }) {
    return HomeState(
      status: status ?? this.status,
      cartBadgeCount: cartBadgeCount ?? this.cartBadgeCount,
      bannerCurrentIndex: bannerCurrentIndex ?? this.bannerCurrentIndex,
    );
  }
}
