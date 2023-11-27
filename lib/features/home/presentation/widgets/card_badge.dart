import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/themes/color_themes.dart';
import '../../../../configs/themes/dimens.dart';
import '../../../../core/extensions/string_extensions.dart';

class CardBadge extends StatelessWidget {
  final String? badge;
  final String icon;
  final Function? onPress;

  const CardBadge({
    super.key,
    required this.icon,
    this.onPress,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void Function()?,
      child: SizedBox(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
          Container(
            padding: const EdgeInsets.all(12),
             height: iconSizeLarge,
            width: iconSizeLarge,
            decoration: const BoxDecoration(
                color: colorLightGrey, shape: BoxShape.circle),
            child: SvgPicture.asset(icon),
          ),
          !badge.isNullOrEmpty() ? _buildBadge() : const SizedBox(),
        ]),
      ),
    );
  }

  _buildBadge() => Positioned(
        top: -3,
        right: -4,
        child: Container(
          alignment: Alignment.center,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          padding: const EdgeInsets.all(3),
          child: Text(
            badge!,
            style: const TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      );
}
