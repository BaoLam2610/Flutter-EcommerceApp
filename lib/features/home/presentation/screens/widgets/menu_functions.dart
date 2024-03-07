import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../domain/entities/menu_function_type.dart';

class MenuFunctions extends StatelessWidget {
  const MenuFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: MenuFunctionType.values.length,
        itemBuilder: (context, index) =>
            _ItemMenuFunction(MenuFunctionType.values[index]),
      ),
    );
  }
}

class _ItemMenuFunction extends StatelessWidget {
  final MenuFunctionType menuFunction;

  const _ItemMenuFunction(this.menuFunction);

  double _getItemSize(BuildContext context) {
    return (context.width / 4) - 8.w;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      height: _getItemSize(context),
      width: _getItemSize(context),
      decoration: BoxDecoration(
        color: AppColors.current.background,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 4.h),
          RoundedIconCard(
            icon: menuFunction.icon,
            size: _getItemSize(context) * 0.6,
            backgroundColor: AppColors.current.primary,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              menuFunction.label.tr(),
              style: AppTextStyles.regular12,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
