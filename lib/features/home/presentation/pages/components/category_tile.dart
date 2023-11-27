import 'package:flutter/material.dart';

import '../../../../../configs/themes/dimens.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../domain/models/category.dart';
import '../../widgets/category_card.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: iconSizeLarge,
      child: Column(
        children: [
          CategoryCard(icon: category.icon),
          Text(
            category.title,
            style: context.bodySmall,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
