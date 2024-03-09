import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../configs/configs.dart';
import '../../../../../gen/gen.dart';
import '../../../../app/presentation/widgets/item/product_tile.dart';

class SellingProducts extends StatelessWidget {
  const SellingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            LocaleKeys.selling_products.tr(),
            style: AppTextStyles.bold16,
          ),
        ),
        SizedBox(height: 10.h),
        MasonryGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          itemCount: 10,
          itemBuilder: (context, index) => ProductTile.grid(),
        ),
      ],
    );
  }
}
