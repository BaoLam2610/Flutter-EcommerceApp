import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/themes/color_themes.dart';
import '../../../../configs/themes/dimens.dart';

class SocialCard extends StatelessWidget {
  final String icon;
  final Function? onPress;

  const SocialCard({super.key, required this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void Function()?,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: iconSizeLarge,
        width: iconSizeLarge,
        decoration:
            const BoxDecoration(color: colorLightGrey, shape: BoxShape.circle),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
