import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';

enum ProductTileType { grid, list }

class ProductTile extends StatelessWidget {
  final ProductTileType _type;

  factory ProductTile.grid() => const ProductTile(type: ProductTileType.grid);

  factory ProductTile.list() => const ProductTile(type: ProductTileType.list);

  const ProductTile({
    super.key,
    ProductTileType? type,
  }) : _type = type ?? ProductTileType.grid;

  double _getItemWidth(BuildContext context) {
    if (_type == ProductTileType.grid) {
      return (context.width / 2) - 12.w;
    }
    return 140.w;
  }

  double _getImageHeight(BuildContext context) {
    return (_getItemWidth(context) / 0.6) * 0.6;
  }

  double get _paddingHorizontal => 6.w;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getItemWidth(context),
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.current.background,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.current.line,
          width: 1.r,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImageArea(context),
              _buildTitle,
              SizedBox(height: 4.h),
              _buildPriceArea,
              const Spacer(),
              _buildAddToCartButton,
              SizedBox(height: 8.h),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageArea(BuildContext context) => Container(
        height: _getImageHeight(context),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),
      );

  Widget get _buildTitle => Padding(
        padding: EdgeInsets.symmetric(horizontal: _paddingHorizontal),
        child: Text(
          'Product name\nProduct name',
          style: AppTextStyles.regular14,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget get _buildPriceArea {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: _paddingHorizontal),
        /* Origin price */
        Text(
          '140,000đ',
          style: AppTextStyles.bold14.copyWith(
            color: AppColors.current.critical,
          ),
        ),
        const Spacer(),
        Text(
          '189,000đ',
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.current.secondaryText,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        SizedBox(width: _paddingHorizontal),
      ],
    );
  }

  Widget get _buildAddToCartButton {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _paddingHorizontal),
      child: AppButton.primary(
        text: 'Add to cart',
        textStyle: AppTextStyles.bold12.copyWith(
          color: AppColors.current.background,
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
      ),
    );
  }
}
