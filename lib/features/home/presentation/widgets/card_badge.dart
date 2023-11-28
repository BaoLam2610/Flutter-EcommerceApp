import 'package:flutter/material.dart';

import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/widgets/ui/circle_card.dart';

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
            CircleCard(icon: icon),
            !badge.isNullOrEmpty() ? _buildBadge() : const SizedBox(),
          ],
        ),
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
