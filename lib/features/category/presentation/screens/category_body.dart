import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildCategoryColumn,
        ),
        Expanded(flex: 3, child: _buildProductColumn),
      ],
    );
  }

  Widget get _buildCategoryColumn {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        height: 50.h,
        color: Colors.red,
      ),
    );
  }

  Widget get _buildProductColumn {
    return MasonryGridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      itemCount: 30,
      itemBuilder: (context, index) =>
          Container(height: 100, color: Colors.blue, margin: EdgeInsets.all(2.r),),
    );
  }
}
