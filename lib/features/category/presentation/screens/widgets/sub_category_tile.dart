import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../../../gen/gen.dart';
import '../../../domain/enities/sub_category_entity.dart';

class SubCategoryTile extends StatelessWidget {
  final VoidCallback? onTap;
  final SubCategoryEntity _subCategory;

  const SubCategoryTile({
    super.key,
    required SubCategoryEntity subCategory,
    this.onTap,
  }) : _subCategory = subCategory;

  @override
  Widget build(BuildContext context) {
    return MaterialEffect(
      onTap: onTap,
      child: Container(
        color: _subCategory.isSelected
            ? AppColors.current.primary.withOpacity(0.2)
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.h,
            ),
            if (_subCategory.type == SubCategoryType.item) ...{
              _buildImageArea(context),
            },
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: _subCategory.type == SubCategoryType.all ? 6.h : 0,
              ),
              child: Text(
                _subCategory.type == SubCategoryType.item
                    ? _subCategory.name
                    : LocaleKeys.all.tr(),
                style: AppTextStyles.regular10,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              height: 1.h,
              color: AppColors.current.line,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageArea(BuildContext context) => NetworkImageView.circle(
        imageUrl: _subCategory.imageUrl,
        height: 40.h,
        fit: BoxFit.scaleDown,
        colorBgr: AppColors.current.primarySup,
      );
}
