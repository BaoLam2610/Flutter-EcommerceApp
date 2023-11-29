import 'package:flutter/material.dart';

import '../../../../../configs/themes/color_themes.dart';
import '../../../../../configs/themes/dimens.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../../../core/widgets/base/base_tile.dart';
import '../../../../../core/widgets/ui/rounded_icon_card.dart';
import '../../../domain/models/popular_product.dart';
import '../../widgets/aspect_ratio_image.dart';

class PopularProductTile extends TileStatefulWidget<PopularProduct> {
  final void Function(int indexPressed)? onFavoritePressed;

  const PopularProductTile({
    super.key,
    required super.data,
    required super.position,
    this.onFavoritePressed,
  });

  @override
  State<PopularProductTile> createState() => _PopularProductTileState();
}

class _PopularProductTileState extends TileState<PopularProductTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageArea(),
          _buildTitleArea(context),
          _buildPriceAndFavoriteArea(context),
        ],
      ),
    );
  }

  _buildImageArea() => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: colorLightGrey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatioImage(
            image: widget.data.image,
            fit: BoxFit.contain,
          ),
        ),
      );

  _buildTitleArea(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          '${widget.data.name}\n',
          style: context.bodyLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );

  _buildPriceAndFavoriteArea(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${widget.data.price}',
              style: context.headlineSmall?.copyWith(color: context.primary),
            ),
            GestureDetector(
              onTap: _onFavoritePressed,
              child: RoundedIconCard(
                icon: ic_favorite_2,
                cardSize: iconSizeMedium,
                backgroundColor: widget.data.isFavorite ? colorLightRed : null,
                iconColor: widget.data.isFavorite ? Colors.red : null,
              ),
            )
          ],
        ),
      );

  void _onFavoritePressed() {
    if (widget.onFavoritePressed == null) return;
    setState(() {
      widget.onFavoritePressed!(widget.position!);
    });
  }
}
