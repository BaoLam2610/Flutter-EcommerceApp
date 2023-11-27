import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/themes/color_themes.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final Function? onPress;

  const CategoryCard({
    super.key,
    required this.icon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colorLightOrange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
