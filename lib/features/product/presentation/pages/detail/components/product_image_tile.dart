import 'package:flutter/material.dart';

import '../../../../../../core/constants/images.dart';
import '../../../../../../core/widgets/base/base_tile.dart';
import '../../../../domain/models/product.dart';

class ProductImageTile extends TileStatefulWidget<String> {
  const ProductImageTile({super.key, required super.data});

  @override
  State<ProductImageTile> createState() => _ProductImageTileState();
}

class _ProductImageTileState extends TileState<ProductImageTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        child: AspectRatio(
            aspectRatio: 1, child: Image.asset(widget.data)),
      ),
    );
  }
}
