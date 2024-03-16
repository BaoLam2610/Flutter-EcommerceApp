import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../configs/configs.dart';
import '../../../../utils/utils.dart';
import 'bloc/category_cubit.dart';
import 'widgets/category_tile.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.current.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: _buildCategoryColumn,
          ),
          Expanded(flex: 3, child: _buildProductColumn),
        ],
      ),
    );
  }

  Widget get _buildCategoryColumn {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          previous.categories != current.categories,
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.categories.length,
          itemBuilder: (context, index) => CategoryTile(
            category: state.categories[index],
          ),
        );
      },
    );
  }

  Widget get _buildProductColumn {
    return MasonryGridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      itemCount: 30,
      itemBuilder: (context, index) => Container(
        height: 100,
        color: Colors.blue,
        margin: EdgeInsets.all(2.r),
      ),
    );
  }
}
