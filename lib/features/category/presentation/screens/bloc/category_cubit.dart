import '../../../../../core/bloc/base_bloc.dart';
import '../../../../../core/bloc/bloc_state.dart';

part 'category_state.dart';

class CategoryCubit extends BaseCubit<CategoryState> {
  CategoryCubit() : super(CategoryState(status: Initialize()));
}
