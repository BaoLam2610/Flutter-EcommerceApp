import 'package:flutter/material.dart';

import '../../../../../core/extensions/widget_extensions.dart';
import '../../../domain/models/special_offer.dart';
import '../../widgets/aspect_ratio_image.dart';

class SpecialOfferTile extends StatelessWidget {
  final SpecialOffer offer;
  const SpecialOfferTile({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return AspectRatioImage(
      fit: BoxFit.cover,
      ratio: 16/9,
      image: offer.image,
      borderRadius: 20,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(.3)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offer.title,
                style: context.displayMedium?.copyWith(color: Colors.white),
              ),
              Text(
                '${offer.totalBrands} Brands',
                style: context.bodySmall?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
