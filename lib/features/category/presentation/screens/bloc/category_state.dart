part of 'category_cubit.dart';

class CategoryState extends BaseState {
  final List<CategoryEntity> categories;

  const CategoryState({
    required super.status,
    this.categories = const [],
  });

  @override
  List<Object> get props => [status, categories];

  CategoryState copyWith({
    Resource? status,
    List<CategoryEntity>? categories,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }
}
