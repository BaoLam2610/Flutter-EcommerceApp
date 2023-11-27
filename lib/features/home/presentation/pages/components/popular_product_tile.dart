import 'package:flutter/material.dart';

import '../../../../../configs/themes/color_themes.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../domain/models/popular_product.dart';
import '../../widgets/aspect_ratio_image.dart';

class PopularProductTile extends StatelessWidget {
  final PopularProduct product;
  const PopularProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImageArea(),
        _buildTitleArea(context),
        _buildPriceAndFavoriteArea(context),
      ],
    );
  }

  _buildImageArea() => SizedBox(
        height: 200,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: colorLightGrey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AspectRatioImage(
              image: product.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );

  _buildTitleArea(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          product.name,
          style: context.bodyLarge,
        ),
      );

  _buildPriceAndFavoriteArea(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          children: [
            Text(
              '\$${product.price}',
              style: context.titleMedium?.copyWith(color: context.primary),
            ),
            const Spacer(),
            const Icon(Icons.favorite_outline)
          ],
        ),
      );
}
