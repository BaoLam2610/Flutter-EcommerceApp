import 'package:flutter/material.dart';

import '../../../../core/widgets/ui/circle_card.dart';

class SocialCard extends StatelessWidget {
  final String icon;
  final Function? onPress;

  const SocialCard({super.key, required this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void Function()?,
      child: CircleCard(icon: icon),
    );
  }
}
