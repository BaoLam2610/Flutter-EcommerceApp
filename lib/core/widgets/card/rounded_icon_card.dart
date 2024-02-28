import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../configs/themes/themes.dart';

class RoundedIconCard extends StatelessWidget {
  final double? cardSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final String icon;
  final EdgeInsets? padding;
  final double? iconSize;
  final BoxShape? boxShape;

  const RoundedIconCard({
    super.key,
    this.cardSize,
    this.backgroundColor,
    required this.icon,
    this.padding,
    this.iconSize,
    this.iconColor,
    this.boxShape,
  });

  @override
  Widget build(BuildContext context) {
    ColorFilter? colorFilter;
    if (iconColor != null) {
      colorFilter = ColorFilter.mode(iconColor!, BlendMode.srcIn);
    }

    return Container(
      padding: padding ?? EdgeInsets.all(12.r),
      height: cardSize ?? 52.r,
      width: cardSize ?? 52.r,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.current.surface,
        shape: boxShape ?? BoxShape.circle,
      ),
      child: SvgPicture.asset(
        icon,
        colorFilter: colorFilter,
      ),
    );
  }
}
