import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../../../gen/gen.dart';
import '../../../domain/enities/category_entity.dart';
import '../bloc/category_cubit.dart';
import 'sub_category_tile.dart';

class CategoryTile extends StatelessWidget {
  final CategoryEntity _category;

  const CategoryTile({
    super.key,
    required CategoryEntity category,
  }) : _category = category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleArea(context),
          Container(
            height: 1.h,
            color: AppColors.current.line,
          ),
          _subCategoriesArea,
        ],
      ),
    );
  }

  Widget _titleArea(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.r),
      child: MaterialEffect(
        onTap: () => ReadContext(context)
            .read<CategoryCubit>()
            .updateCategoryCollapsed(_category.id),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _category.name,
                style: AppTextStyles.bold10.copyWith(
                  color: _category.isSelected
                      ? AppColors.current.primary
                      : AppColors.current.primaryText,
                ),
                maxLines: 2,
              ),
            ),
            _category.isCollapsed
                ? Assets.icons.icArrowDownSmall.svg(colorFilter: _colorFilter)
                : Assets.icons.icArrowUpSmall.svg(colorFilter: _colorFilter)
          ],
        ),
      ),
    );
  }

  ColorFilter get _colorFilter => ColorFilter.mode(
      _category.isSelected
          ? AppColors.current.primary
          : AppColors.current.primaryText,
      BlendMode.srcIn);

  Widget get _subCategoriesArea {
    return Visibility(
      visible: _category.isCollapsed,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _category.subCategories.length,
        itemBuilder: (context, index) => SubCategoryTile(
          subCategory: _category.subCategories[index],
          onTap: () => ReadContext(context)
              .read<CategoryCubit>()
              .updateCategorySelected(
                  id: _category.id, subId: _category.subCategories[index].id),
        ),
      ),
    );
  }
}
