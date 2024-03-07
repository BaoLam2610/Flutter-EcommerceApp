import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/themes.dart';

class RoundedIconCard extends StatelessWidget {
  final double? size;
  final Color? backgroundColor;
  final Widget icon;
  final EdgeInsets? padding;
  final BoxShape? boxShape;

  const RoundedIconCard({
    super.key,
    this.size,
    this.backgroundColor,
    required this.icon,
    this.padding,
    this.boxShape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(12.r),
      height: size ?? 52.r,
      width: size ?? 52.r,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.current.surface,
        shape: boxShape ?? BoxShape.circle,
      ),
      child: icon,
    );
  }
}
