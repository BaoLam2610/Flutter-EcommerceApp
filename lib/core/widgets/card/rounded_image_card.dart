import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/themes.dart';

class RoundedImageCard extends StatelessWidget {
  final double? cardSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final String image;
  final EdgeInsets? padding;
  final double? iconSize;
  final BoxShape? boxShape;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  const RoundedImageCard({
    super.key,
    this.cardSize,
    this.backgroundColor,
    required this.image,
    this.padding,
    this.iconSize,
    this.iconColor,
    this.boxShape,
    this.fit,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(12.r),
      height: cardSize ?? 52.r,
      width: cardSize ?? 52.r,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.current.surface,
        shape: boxShape ?? BoxShape.rectangle,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      child: Image.asset(
        image,
        fit: fit,
      ),
    );
  }
}
