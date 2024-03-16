import '../../domain/enities/sub_category_entity.dart';

class SubCategoryDto extends SubCategoryEntity {
  const SubCategoryDto({
    String? id,
    String? parentId,
    String? name,
    String? imageUrl,
    SubCategoryType? type,
  }) : super(
          id: id ?? '',
          parentId: parentId ?? '',
          name: name ?? '',
          imageUrl: imageUrl ?? '',
          type: type ?? SubCategoryType.item,
        );

  factory SubCategoryDto.all(
    String? id,
  ) {
    return SubCategoryDto(id: id, type: SubCategoryType.all);
  }

  factory SubCategoryDto.fromJson(Map<String, dynamic> json) {
    return SubCategoryDto(
      id: json['id'],
      parentId: json['categoryId'],
      name: json['subCategoryName'],
      imageUrl: json['image'],
    );
  }
}
