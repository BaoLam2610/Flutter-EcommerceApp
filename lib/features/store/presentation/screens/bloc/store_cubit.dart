import '../../../../../core/core.dart';

part 'store_state.dart';

class StoreCubit extends BaseCubit<StoreState> {
  StoreCubit() : super(StoreState(status: Initialize()));
}
