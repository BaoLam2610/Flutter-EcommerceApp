import '../../../../core/core.dart';

class ProductFilterRequest extends PagingData {
  final String? categoryId;
  final String? subCategoryId;
  final String? brandId;

  const ProductFilterRequest({
    this.categoryId,
    this.subCategoryId,
    this.brandId,
    required super.pageSize,
    required super.currentPage,
  });

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    if (categoryId != null) {
      json['categoryId'] = categoryId;
    }
    if (subCategoryId != null) {
      json['subCategoryId'] = subCategoryId;
    }
    if (brandId != null) {
      json['brandId'] = brandId;
    }
    return json;
  }
}
