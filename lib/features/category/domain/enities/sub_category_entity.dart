import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final String id;
  final String parentId;
  final String name;
  final String imageUrl;
  final bool isSelected;
  final SubCategoryType type;

  const SubCategoryEntity({
    required this.id,
    required this.parentId,
    required this.name,
    required this.imageUrl,
    this.isSelected = false,
    this.type = SubCategoryType.item,
  });

  @override
  List<Object> get props => [id, parentId, name, imageUrl, isSelected, type];

  @override
  String toString() {
    return 'SubCategoryEntity{name: $name, isSelected: $isSelected}';
  }

  SubCategoryEntity copyWith({
    String? id,
    String? parentId,
    String? name,
    String? imageUrl,
    bool? isSelected,
    SubCategoryType? type,
  }) {
    return SubCategoryEntity(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isSelected: isSelected ?? this.isSelected,
      type: type ?? this.type,
    );
  }
}

enum SubCategoryType {
  item,
  all,
}
