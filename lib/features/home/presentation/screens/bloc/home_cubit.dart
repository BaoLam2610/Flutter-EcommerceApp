import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../../domain/entities/event_entity.dart';
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
      params: const PagingData(
        pageSize: 5,
        currentPage: 1,
      ),
    );

    if (resource is Success) {
      final products = resource.data?.products ?? [];
      final totalSellingProducts = resource.data?.totalSellingProducts ?? 0;
      emit(state.copyWith(
        status: const Success(),
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
  }

  Future<void> getSellingProducts() async {
    var currentPage = state.sellingProductCurrentPage + 1;
    final resource = await _getSellingProductsUseCase.call(
      params: PagingData(
        pageSize: 5,
        currentPage: currentPage,
      ),
    );
    if (resource is Success) {
      final newList = state.products + (resource.data ?? []);
      emit(
        state.copyWith(
          products: newList,
          sellingProductCurrentPage: currentPage,
          canLoadMoreSellingProducts:
              currentPage < (resource.pageResult?.totalPage ?? 0),
        ),
      );
    }
  }

  Future<void> onSellingProductsLoadMore() async {
    if (!state.canLoadMoreSellingProducts) return;
    await getSellingProducts();
  }

  Future<void> onReloadHomeData() async {
    emit(state.copyWith(
      sellingProductCurrentPage: 1,
    ));
    await getHomeData(isRefresh: true);
  }
}
