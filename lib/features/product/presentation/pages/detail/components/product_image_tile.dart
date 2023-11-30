import 'package:flutter/material.dart';

import '../../../../../../core/extensions/widget_extensions.dart';
import '../../../../../../core/widgets/base/base_tile.dart';
import '../../../../domain/models/product_image.dart';

class ProductImageTile extends TileStatefulWidget<ProductImage> {
  final void Function(ProductImage item)? onItemPressed;
  const ProductImageTile({
    super.key,
    required super.data,
    this.onItemPressed,
  });

  @override
  State<ProductImageTile> createState() => _ProductImageTileState();
}

class _ProductImageTileState extends TileState<ProductImageTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.onItemPressed!(widget.data);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color:
                  widget.data.isSelected ? context.primary : Colors.transparent,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: AspectRatio(
              aspectRatio: 1, child: Image.asset(widget.data.image)),
        ),
      ),
    );
  }
}
