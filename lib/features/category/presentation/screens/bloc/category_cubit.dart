import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../domain/enities/category_entity.dart';
import '../../../domain/usecase/get_categories.dart';

part 'category_state.dart';

class CategoryCubit extends BaseCubit<CategoryState> {
  final _getCategoriesUseCase = inject.get<GetCategoriesUseCase>();

  CategoryCubit() : super(CategoryState(status: Initialize()));

  void getCategories() async {
    emit(state.copyWith(status: Loading()));
    final resource = await _getCategoriesUseCase.call();
    if (resource is Success) {
      emit(state.copyWith(categories: resource.data));
    }
    emit(state.copyWith(status: resource));
  }

  void updateCategorySelected({
    required String id,
    required String subId,
  }) {
    final updateList = state.categories
        .map((e) => e.copyWith(
            isSelected: false,
            subCategories: e.subCategories
                .map((e) => e.copyWith(isSelected: false))
                .toList()))
        .toList();
    final index = updateList.indexWhere((element) => element.id == id);

    final updateSubList = updateList[index]
        .subCategories
        .map((e) => e.copyWith(isSelected: false))
        .toList();

    final subIndex = updateSubList.indexWhere((element) => element.id == subId);
    updateSubList[subIndex] =
        updateSubList[subIndex].copyWith(isSelected: true);

    updateList[index] = updateList[index].copyWith(
      subCategories: updateSubList,
      isSelected: true,
    );

    emit(state.copyWith(categories: updateList));
  }

  void updateCategoryCollapsed(String id) {
    final updateList = [...state.categories];
    final index = state.categories.indexWhere((element) => element.id == id);
    updateList[index] = updateList[index].copyWith(
      isCollapsed: !updateList[index].isCollapsed,
    );
    emit(state.copyWith(categories: updateList));
  }
}
