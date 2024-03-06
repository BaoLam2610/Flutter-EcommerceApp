import '../../../../../core/core.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeState(status: Initialize()));

  void updateCartBadgeCount(int count) {
    emit(state.copyWith(cartBadgeCount: count));
  }

  void updateBannerCurrentIndex(int index) {
    emit(state.copyWith(bannerCurrentIndex: index));
  }
}
