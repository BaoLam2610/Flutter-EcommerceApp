import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../domain/entities/event_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/get_home_data.dart';
import '../../../domain/usecases/get_selling_products.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final _getHomeDataUseCase = inject.get<GetHomeDataUseCase>();
  final _getSellingProductsUseCase = inject.get<GetSellingProductsUseCase>();

  HomeCubit() : super(HomeState(status: Initialize()));

  int get bannerCurrentIndex => state.bannerCurrentIndex;

  void updateCartBadgeCount(int count) {
    emit(state.copyWith(cartBadgeCount: count));
  }

  void updateBannerCurrentIndex(int index) {
    emit(state.copyWith(bannerCurrentIndex: index));
  }

  Future<void> getHomeData({bool isRefresh = false}) async {
    emit(state.copyWith(status: isRefresh ? null : Loading()));
    await postDelay(seconds: 2);
    final resource = await _getHomeDataUseCase.call(
      params: PagingData(pageSize: 2, currentPage: 1),
    );

    if (resource is Success) {
      final products = resource.data?.products ?? [];
      final totalSellingProducts = resource.data?.totalSellingProducts ?? 0;
      emit(state.copyWith(
        status: Success(),
        events: resource.data?.events,
        products: resource.data?.products,
        canLoadMoreSellingProducts: products.isNotEmpty
            ? products.length < totalSellingProducts
            : false,
      ));
    } else {
      emit(state.copyWith(
        status: resource,
        events: [],
        products: [],
        canLoadMoreSellingProducts: false,
      ));
    }

    // emit(state.copyWith(
    //   status: resource,
    //   events: resource.data?.events,
    //   products: resource.data?.products,
    //   canLoadMoreSellingProducts: resource.data == null
    //       resource.data!.products.length < resource.data!.totalSellingProducts,
    // ));
  }

  Future<void> getSellingProducts() async {
    var currentPage = state.sellingProductCurrentPage + 1;
    final resource = await _getSellingProductsUseCase.call(
      params: PagingData(pageSize: 2, currentPage: currentPage),
    );
    if (resource is Success) {
      final newList = state.products + (resource.data ?? []);

      emit(state.copyWith(
        products: newList,
        sellingProductCurrentPage: currentPage,
      ));
    }
  }

  Future<void> onSellingProductsLoadMore() async {
    await getSellingProducts();
  }

  Future<void> onReloadHomeData() async {
    await getHomeData(isRefresh: true);
  }
}
