import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../../gen/gen.dart';

class MainAppBar extends StatelessWidget {
  final int? _cartBadgeCount;
  final VoidCallback? _onCartTap;
  final VoidCallback? _onSearchTap;

  const MainAppBar({
    super.key,
    int? cartBadgeCount,
    void Function()? onCartTap,
    void Function()? onSearchTap,
  })  : _onSearchTap = onSearchTap,
        _onCartTap = onCartTap,
        _cartBadgeCount = cartBadgeCount;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primaryMaterialColor[200],
      floating: true,
      collapsedHeight: 56.h,
      flexibleSpace: _buildAppBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: context.mediaQuery.viewPadding.top,
          left: 18.w,
          right: 18.w,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: _buildSearchArea),
              SizedBox(width: 12.w),
              _buildCartArea,
            ],
          ),
        ),
      );

  Widget get _buildSearchArea => SearchField.small(
        readOnly: true,
        onTap: _onSearchTap,
        searchIconColor: AppColors.current.primary,
      );

  Widget get _buildCartArea => MaterialEffect(
        onTap: _onCartTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Assets.icons.icShoppingCartSolid.svg(
              width: 24.r,
              height: 24.r,
              colorFilter: ColorFilter.mode(
                AppColors.current.background,
                BlendMode.srcIn,
              ),
            ),
            if (_cartBadgeCount != null && _cartBadgeCount! > 0) ...{
              Positioned(
                right: -4.w,
                top: -4.h,
                child: Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    color: AppColors.current.critical,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12.r,
                    minHeight: 12.r,
                  ),
                  child: Text(
                    _cartBadgeCount! > 9 ? '9+' : '$_cartBadgeCount',
                    style: AppTextStyles.regular8.copyWith(
                      color: AppColors.current.background,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            }
          ],
        ),
      );
}
