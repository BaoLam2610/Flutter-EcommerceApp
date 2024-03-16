import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../../../gen/gen.dart';
import '../../shared.dart';

enum ProductTileType { grid, list }

enum DisplayPriceDirection { horizontal, vertical }

class ProductTile extends StatelessWidget {
  final ProductEntity _product;
  final ProductTileType _type;
  final DisplayPriceDirection _displayPriceDirection;
  final double _imageAspectRatio;

  factory ProductTile.grid(
    ProductEntity product, {
    DisplayPriceDirection? displayPriceDirection,
        double? imageAspectRatio,
  }) =>
      ProductTile(
        type: ProductTileType.grid,
        product: product,
        displayPriceDirection: displayPriceDirection,
        imageAspectRatio: imageAspectRatio ?? 2,
      );

  factory ProductTile.list(
    ProductEntity product, {
    DisplayPriceDirection? displayPriceDirection,
        double? imageAspectRatio,
  }) =>
      ProductTile(
        type: ProductTileType.list,
        product: product,
        displayPriceDirection: displayPriceDirection,
        imageAspectRatio: imageAspectRatio ?? 1.8,
      );

  const ProductTile({
    super.key,
    ProductTileType? type,
    required ProductEntity product,
    DisplayPriceDirection? displayPriceDirection,
    double? imageAspectRatio,
  })  : _imageAspectRatio = imageAspectRatio ?? 1,
        _displayPriceDirection =
            displayPriceDirection ?? DisplayPriceDirection.horizontal,
        _product = product,
        _type = type ?? ProductTileType.grid;

  double _getItemWidth(BuildContext context) {
    if (_type == ProductTileType.grid) {
      return (context.width / _imageAspectRatio) - 12.w;
    }
    return (context.width / _imageAspectRatio) - 12.w;
  }

  double _getImageHeight(BuildContext context) => _getItemWidth(context);

  double get _paddingHorizontal => 6.w;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Align(child: _buildImageArea(context)),
              _buildTitle,
              SizedBox(height: 4.h),
              _buildPriceArea,
              _buildAddToCartButton,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageArea(BuildContext context) => NetworkImageView(
        imageUrl: _product.imageUrl,
        width: _getImageHeight(context),
        height: _getImageHeight(context),
        fit: BoxFit.contain,
        imageBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      );

  Widget get _buildTitle => Padding(
        padding: EdgeInsets.symmetric(horizontal: _paddingHorizontal),
        child: Text(
          _product.displayProduct,
          style: AppTextStyles.regular14,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget get _buildPriceArea {
    if (_displayPriceDirection == DisplayPriceDirection.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: _paddingHorizontal),
          Text(
            _product.textPrice,
            style: AppTextStyles.bold14.copyWith(
              color: AppColors.current.critical,
            ),
          ),
          const Spacer(),
          if (_product.discountPrice != 0) ...{
            Text(
              _product.textDiscountPrice,
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.current.secondaryText,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: _paddingHorizontal),
          }
        ],
      );
    }
    return Column(
      children: [
        Align(
          child: Text(
            _product.textPrice,
            style: AppTextStyles.bold14.copyWith(
              color: AppColors.current.critical,
            ),
          ),
        ),
        if (_product.discountPrice != 0) ...{
          Text(
            _product.textDiscountPrice,
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.current.secondaryText,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        } else ...{
          Text(
            '',
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.current.secondaryText,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        }
      ],
    );
  }

  Widget get _buildAddToCartButton {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _paddingHorizontal,
        vertical: 8.h,
      ),
      child: AppButton.primary(
        onTap: () {},
        text: LocaleKeys.add_to_cart.tr(),
        textStyle: AppTextStyles.bold12.copyWith(
          color: AppColors.current.background,
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
      ),
    );
  }
}
