import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import 'main_app_bar.dart';

class MainNormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int? _cartBadgeCount;
  final VoidCallback? _onCartTap;
  final VoidCallback? _onSearchTap;

  const MainNormalAppBar({
    super.key,
    int? cartBadgeCount,
    void Function()? onCartTap,
    void Function()? onSearchTap,
  })  : _onSearchTap = onSearchTap,
        _onCartTap = onCartTap,
        _cartBadgeCount = cartBadgeCount;

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      colorBgr: AppColors.current.primary,
      cartBadgeCount: _cartBadgeCount,
      onCartTap: _onCartTap,
      onSearchTap: _onSearchTap,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
