part of 'home_cubit.dart';

class HomeState extends BaseState {
  final int cartBadgeCount;
  final int bannerCurrentIndex;
  final int sellingProductCurrentPage;
  final List<EventEntity> events;
  final List<ProductEntity> products;
  final bool canLoadMoreSellingProducts;

  const HomeState({
    required super.status,
    this.cartBadgeCount = 0,
    this.bannerCurrentIndex = 0,
    this.sellingProductCurrentPage = 1,
    this.events = const [],
    this.products = const [],
    this.canLoadMoreSellingProducts = false,
  });

  @override
  List<Object> get props => [
        cartBadgeCount,
        bannerCurrentIndex,
        sellingProductCurrentPage,
        status,
        events,
        products,
        canLoadMoreSellingProducts,
      ];

  @override
  HomeState copyWith({
    Resource? status,
    int? cartBadgeCount,
    int? bannerCurrentIndex,
    int? sellingProductCurrentPage,
    List<EventEntity>? events,
    List<ProductEntity>? products,
    bool? canLoadMoreSellingProducts,
  }) {
    return HomeState(
      status: status ?? this.status,
      cartBadgeCount: cartBadgeCount ?? this.cartBadgeCount,
      bannerCurrentIndex: bannerCurrentIndex ?? this.bannerCurrentIndex,
      sellingProductCurrentPage:
          sellingProductCurrentPage ?? this.sellingProductCurrentPage,
      events: events ?? this.events,
      products: products ?? this.products,
      canLoadMoreSellingProducts:
          canLoadMoreSellingProducts ?? this.canLoadMoreSellingProducts,
    );
  }
}
