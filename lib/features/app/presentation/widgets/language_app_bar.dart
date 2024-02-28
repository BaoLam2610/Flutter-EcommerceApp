import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_bar/app_bar.dart';
import '../../../../gen/assets.gen.dart';

class LanguageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? textStyle;
  final double? height;
  final Color? colorBgr;
  final bool isShowBack;
  final VoidCallback? onTapBack;

  const LanguageAppBar({
    super.key,
    required this.title,
    this.textStyle,
    this.height,
    this.colorBgr,
    this.isShowBack = false,
    this.onTapBack,
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? (56.h));

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      textStyle: textStyle,
      colorBgr: colorBgr,
      isShowBack: isShowBack,
      onTapBack: onTapBack,
      height: height,
      actionButton: Assets.icons.flagVn.svg(
        width: 24.r,
        height: 24.r,
      ),
    );
  }
}
