import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../domain/entities/event_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/get_home_data.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final _getHomeDataUseCase = inject.get<GetHomeDataUseCase>();

  HomeCubit() : super(HomeState(status: Initialize()));

  int get bannerCurrentIndex => state.bannerCurrentIndex;

  void updateCartBadgeCount(int count) {
    emit(state.copyWith(cartBadgeCount: count));
  }

  void updateBannerCurrentIndex(int index) {
    emit(state.copyWith(bannerCurrentIndex: index));
  }

  void getHomeData() async {
    emit(state.copyWith(status: Loading()));
    final resource = await _getHomeDataUseCase.call(params: PagingData.deft());
    emit(state.copyWith(
      status: resource,
      events: resource.data?.events,
      products: resource.data?.products,
    ));
  }
}
