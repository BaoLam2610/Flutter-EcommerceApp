import 'package:flutter/material.dart';

import '../../../../../configs/themes/dimens.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../../../core/widgets/base/base_tile.dart';
import '../../../domain/models/category.dart';
import '../../widgets/category_card.dart';

class CategoryTile extends TileStatelessWidget<Category> {
  const CategoryTile({super.key, required super.data, super.position});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: iconSizeLarge,
      child: Column(
        children: [
          CategoryCard(icon: data.icon),
          const SizedBox(height: 2),
          Text(
            data.title,
            style: context.bodySmall,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
