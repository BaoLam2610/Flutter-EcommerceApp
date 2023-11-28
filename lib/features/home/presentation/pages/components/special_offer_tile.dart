import 'package:flutter/material.dart';

import '../../../../../core/extensions/widget_extensions.dart';
import '../../../../../core/widgets/base/base_tile.dart';
import '../../../domain/models/special_offer.dart';
import '../../widgets/aspect_ratio_image.dart';

class SpecialOfferTile extends TileStatelessWidget<SpecialOffer> {
  const SpecialOfferTile({super.key, required super.data});

  @override
  Widget build(BuildContext context) {
    return AspectRatioImage(
      fit: BoxFit.cover,
      ratio: 16 / 9,
      image: data.image,
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
                data.title,
                style: context.displayMedium?.copyWith(color: Colors.white),
              ),
              Text(
                '${data.totalBrands} Brands',
                style: context.bodySmall?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
