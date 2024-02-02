import 'package:flutter/material.dart';

import '../../../configs/themes/color_themes.dart';
import '../../../configs/themes/dimens.dart';

class RoundedImageCard extends StatelessWidget {
  final double cardSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final String image;
  final EdgeInsets padding;
  final double? iconSize;
  final BoxShape? boxShape;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  const RoundedImageCard({
    super.key,
    this.cardSize = iconSizeLarge,
    this.backgroundColor,
    required this.image,
    this.padding = const EdgeInsets.all(12),
    this.iconSize,
    this.iconColor,
    this.boxShape,
    this.fit,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: cardSize,
      width: cardSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorLightGrey,
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
