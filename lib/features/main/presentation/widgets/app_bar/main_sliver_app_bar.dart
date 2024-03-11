import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import 'main_app_bar.dart';

class MainSliverAppBar extends StatelessWidget {
  final int? _cartBadgeCount;
  final VoidCallback? _onCartTap;
  final VoidCallback? _onSearchTap;

  const MainSliverAppBar({
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
      backgroundColor: AppColors.current.primary,
      floating: true,
      collapsedHeight: 56.h,
      flexibleSpace: MainAppBar(
        cartBadgeCount: _cartBadgeCount,
        onCartTap: _onCartTap,
        onSearchTap: _onSearchTap,
      ),
    );
  }
}
