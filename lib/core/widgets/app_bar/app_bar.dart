import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/themes.dart';
import '../../../gen/assets.gen.dart';
import '../../extensions/extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? textStyle;
  final double? height;
  final Color? colorBgr;
  final Widget? actionButton;
  final bool isShowBack;
  final VoidCallback? onTapBack;

  const CustomAppBar({
    super.key,
    this.height,
    this.colorBgr,
    this.isShowBack = false,
    this.onTapBack,
    this.actionButton,
    this.textStyle,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? (56.h));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height + context.mediaQuery.viewPadding.top,
      width: context.width,
      padding: EdgeInsets.only(top: context.mediaQuery.viewPadding.top),
      color: colorBgr ?? AppColors.current.background,
      child: Stack(
        children: [
          if (isShowBack) ...{
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  context.navigator.maybePop();
                  onTapBack?.call();
                },
                child: Padding(
                  padding: EdgeInsets.all(18.r),
                  child: Assets.icons.backICon.svg(
                    height: 24.r,
                    width: 24.r,
                  ),
                ),
              ),
            ),
          },
          if (actionButton != null) ...{
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: actionButton!,
              ),
            ),
          },
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isShowBack || actionButton != null
                    ? 18.w + 24.r + 4.w
                    : 18.w,
              ),
              child: Center(
                child: Text(
                  title,
                  style: textStyle ?? AppTextStyles.bold24,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
