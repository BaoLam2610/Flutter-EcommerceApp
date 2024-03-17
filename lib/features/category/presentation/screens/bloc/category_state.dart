part of 'category_cubit.dart';

class CategoryState extends BaseState {
  final Resource productStatus;
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;
  final int currentPage;
  final bool canLoadMoreProducts;
  final CategoryEntity? categorySelected;
  final SubCategoryEntity? subCategorySelected;

  const CategoryState({
    required super.status,
    required this.productStatus,
    this.categories = const [],
    this.products = const [],
    this.currentPage = 0,
    this.canLoadMoreProducts = false,
    this.categorySelected,
    this.subCategorySelected,
  });

  @override
  List<Object?> get props =>
      [
        status,
        productStatus,
        categories,
        products,
        currentPage,
        canLoadMoreProducts,
        categorySelected,
        subCategorySelected,
      ];

  CategoryState copyWith({
    Resource? status,
    Resource? productStatus,
    List<CategoryEntity>? categories,
    List<ProductEntity>? products,
    int? currentPage,
    bool? canLoadMoreProducts,
    CategoryEntity? categorySelected,
    SubCategoryEntity? subCategorySelected,
  }) {
    return CategoryState(
      status: status ?? this.status,
      productStatus: productStatus ?? this.productStatus,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      canLoadMoreProducts: canLoadMoreProducts ?? this.canLoadMoreProducts,
      categorySelected: categorySelected ?? this.categorySelected,
      subCategorySelected: subCategorySelected ?? this.subCategorySelected,
    );
  }
}
