import '../../../../../core/core.dart';

part 'category_state.dart';

class CategoryCubit extends BaseCubit<CategoryState> {
  CategoryCubit() : super(CategoryState(status: Initialize()));
}
