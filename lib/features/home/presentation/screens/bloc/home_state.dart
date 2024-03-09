part of 'home_cubit.dart';

class HomeState extends BaseState {
  final int cartBadgeCount;
  final int bannerCurrentIndex;
  final List<EventEntity> events;
  final List<ProductEntity> products;

  const HomeState({
    required super.status,
    this.cartBadgeCount = 0,
    this.bannerCurrentIndex = 0,
    this.events = const [],
    this.products = const [],
  });

  @override
  List<Object> get props => [
        cartBadgeCount,
        bannerCurrentIndex,
        status,
        events,
        products,
      ];

  @override
  HomeState copyWith({
    Resource? status,
    int? cartBadgeCount,
    int? bannerCurrentIndex,
    List<EventEntity>? events,
    List<ProductEntity>? products,
  }) {
    return HomeState(
      status: status ?? this.status,
      cartBadgeCount: cartBadgeCount ?? this.cartBadgeCount,
      bannerCurrentIndex: bannerCurrentIndex ?? this.bannerCurrentIndex,
      events: events ?? this.events,
      products: products ?? this.products,
    );
  }
}
