import 'package:equatable/equatable.dart';

import 'sub_category_entity.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final List<SubCategoryEntity> subCategories;
  final bool isSelected;
  final bool isCollapsed;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.subCategories,
    this.isSelected = false,
    this.isCollapsed = false,
  });

  SubCategoryEntity get subCategorySelected =>
      subCategories.firstWhere((element) => element.isSelected);

  @override
  List<Object> get props => [
        id,
        name,
        imageUrl,
        subCategories,
        isSelected,
        isCollapsed,
      ];

  @override
  String toString() {
    return 'CategoryEntity{name: $name, isSelected: $isSelected, isCollapsed: $isCollapsed}';
  }

  CategoryEntity copyWith({
    String? id,
    String? name,
    String? imageUrl,
    List<SubCategoryEntity>? subCategories,
    bool? isSelected,
    bool? isCollapsed,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      subCategories: subCategories ?? this.subCategories,
      isSelected: isSelected ?? this.isSelected,
      isCollapsed: isCollapsed ?? this.isCollapsed,
    );
  }
}
