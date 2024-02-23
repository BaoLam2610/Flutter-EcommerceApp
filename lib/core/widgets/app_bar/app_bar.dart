import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/themes.dart';
import '../../../gen/assets.gen.dart';
import '../../extensions/extensions.dart';
import '../material_effect/material_effect.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? textStyle;
  final double? height;
  final Color? colorBgr;
  final bool isShowBack;
  final VoidCallback? onTapBack;

  const CustomAppBar({
    super.key,
    this.height,
    this.colorBgr,
    this.isShowBack = false,
    this.onTapBack,
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
      color: colorBgr ?? AppColors.current.background,
      child: Stack(
        children: [
          if (isShowBack) ...{
            Positioned(
              top: context.mediaQuery.viewPadding.top,
              left: 18.w,
              bottom: 0,
              child: MaterialEffect(
                onTap: () {
                  context.navigator.maybePop();
                  onTapBack?.call();
                },
                child: Assets.icons.backICon.svg(
                  height: 24.r,
                  width: 24.r,
                ),
              ),
            ),
          },
          Positioned(
            top: context.mediaQuery.viewPadding.top,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isShowBack ? 18.w + 24.r + 4.w : 18.w,
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
