import '../../../../../core/bloc/base_bloc.dart';
import '../../../../../core/bloc/bloc_state.dart';

part 'store_state.dart';

class StoreCubit extends BaseCubit<StoreState> {
  StoreCubit() : super(StoreState(status: Initialize()));
}
