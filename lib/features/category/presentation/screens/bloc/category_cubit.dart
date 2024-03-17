import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../../domain/enities/category_entity.dart';
import '../../../domain/enities/sub_category_entity.dart';
import '../../../domain/usecase/get_categories.dart';
import '../../../domain/usecase/get_products_by_category.dart';

part 'category_state.dart';

class CategoryCubit extends BaseCubit<CategoryState> {
  final _getCategoriesUseCase = inject.get<GetCategoriesUseCase>();
  final _getProductsByCategoryUseCase =
      inject.get<GetProductsByCategoryUseCase>();

  CategoryCubit()
      : super(CategoryState(
          status: Initialize(),
          productStatus: Loading(),
        ));

  void init() {
    getCategories();
    getProductsByCategory();
  }

  void getCategories() async {
    emit(state.copyWith(status: Loading()));
    await postDelay(seconds: 2);
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

    emit(
      state.copyWith(
        categories: updateList,
        categorySelected: updateList[index],
        subCategorySelected: updateSubList[subIndex],
      ),
    );

    resetLoadProducts();
    getProductsByCategory();
  }

  void updateCategoryCollapsed(String id) {
    final updateList = [...state.categories];
    final index = state.categories.indexWhere((element) => element.id == id);
    updateList[index] = updateList[index].copyWith(
      isCollapsed: !updateList[index].isCollapsed,
    );
    emit(state.copyWith(categories: updateList));
  }

  Future<void> getProductsByCategory({bool isShowLoading = true}) async {
    int currentPage = state.currentPage + 1;
    if (currentPage == 1 && isShowLoading) {
      emit(state.copyWith(productStatus: Loading()));
    }
    await postDelay(seconds: 1);
    final resource = await _getProductsByCategoryUseCase.call(
      params: ProductFilterRequest(
        pageSize: 5,
        currentPage: currentPage,
        categoryId: state.categorySelected?.id,
        subCategoryId: state.subCategorySelected?.type == SubCategoryType.all
            ? null
            : state.subCategorySelected?.id,
      ),
    );
    if (resource is Success) {
      final newList = currentPage == 1
          ? (resource.data ?? [])
          : state.products + (resource.data ?? []);
      emit(state.copyWith(
        productStatus: const Success(),
        products: newList,
        currentPage: currentPage,
        canLoadMoreProducts:
            currentPage < (resource.pageResult?.totalPage ?? 0),
      ));
      return;
    }
    if (resource is Error && currentPage == 1) {
      emit(state.copyWith(
        productStatus: const Error(),
        products: [],
        canLoadMoreProducts: false,
      ));
    }
  }

  void resetLoadProducts() {
    emit(state.copyWith(
      currentPage: 0,
      canLoadMoreProducts: false,
    ));
  }

  Future<void> onProductsLoadMore() async {
    if (!state.canLoadMoreProducts) return;
    await getProductsByCategory();
  }

  Future<void> onReloadProducts({bool isShowLoading = false}) async {
    resetLoadProducts();
    await getProductsByCategory(isShowLoading: isShowLoading);
  }
}
