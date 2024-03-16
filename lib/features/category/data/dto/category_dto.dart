import '../../../../core/core.dart';
import '../../domain/enities/category_entity.dart';
import '../../domain/enities/sub_category_entity.dart';
import 'sub_category_dto.dart';

class CategoryDto extends CategoryEntity {
  CategoryDto({
    String? id,
    String? name,
    String? imageUrl,
    List<SubCategoryEntity>? subCategories,
  }) : super(
          id: id ?? '',
          name: name ?? '',
          imageUrl: imageUrl ?? '',
          subCategories: subCategories == null || subCategories.isEmpty
              ? [SubCategoryDto.all(id)]
              : subCategories
            ..insert(0, SubCategoryDto.all(id)),
        );

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      id: json['id'],
      name: json['categoryName'],
      imageUrl: json['image'],
      subCategories: castToList<SubCategoryDto>(
        json['subCategories'],
        (item) => SubCategoryDto.fromJson(item),
      ),
    );
  }
}
