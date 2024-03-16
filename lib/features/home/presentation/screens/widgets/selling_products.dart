import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../configs/configs.dart';
import '../../../../../gen/gen.dart';
import '../../../../shared/shared.dart';
import '../bloc/home_cubit.dart';

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
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              previous.status != current.status ||
              previous.products != current.products,
          builder: (context, state) {
            return MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              itemCount: state.products.length,
              itemBuilder: (context, index) =>
                  ProductTile.grid(state.products[index]),
            );
          },
        ),
      ],
    );
  }
}
