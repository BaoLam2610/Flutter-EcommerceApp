import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/extensions/widget_extensions.dart';

class RatingCard extends StatelessWidget {
  final double rating;

  const RatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 6,
      ),
      child: Row(
        children: [
          Text(
            rating.toString(),
            style: context.bodyMedium,
          ),
          const SizedBox(
            width: 4,
          ),
          SvgPicture.asset(ic_star),
        ],
      ),
    );
  }
}
