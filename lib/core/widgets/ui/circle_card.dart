import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../configs/themes/color_themes.dart';
import '../../../configs/themes/dimens.dart';

class CircleCard extends StatelessWidget {
  final double cardSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final String icon;
  final EdgeInsets padding;
  final double? iconSize;

  const CircleCard({
    super.key,
    this.cardSize = iconSizeLarge,
    this.backgroundColor,
    required this.icon,
    this.padding = const EdgeInsets.all(12),
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    ColorFilter? colorFilter;
    if (iconColor != null) {
      colorFilter = ColorFilter.mode(iconColor!, BlendMode.srcIn);
    }

    return Container(
      padding: padding,
      height: cardSize,
      width: cardSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorLightGrey,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        icon,
        colorFilter: colorFilter,
      ),
    );
  }
}
