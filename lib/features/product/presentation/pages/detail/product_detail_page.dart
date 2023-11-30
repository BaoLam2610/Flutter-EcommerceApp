import 'package:flutter/material.dart';

import '../../../../../configs/themes/text_themes.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../../../core/widgets/ui/rounded_icon_card.dart';
import '../../../../auth/presentation/widgets/button.dart';
import '../../../../home/presentation/widgets/aspect_ratio_image.dart';
import '../../../domain/models/product_image.dart';
import '../../widgets/rating_card.dart';
import 'components/product_image_tile.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surface,
      body: _buildBody(),
    );
  }

  _buildBody() => SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: _buildProductImageArea(),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: _buildProductInfoArea(),
            )
          ],
        ),
      );

  _buildProductImageArea() => Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: AspectRatioImage(
              image: image_popular_product_1,
              fit: BoxFit.scaleDown,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedIconCard(
                  icon: ic_arrow_back,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(16),
                ),
                RatingCard(rating: 4.8),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 80,
              width: context.width * 0.9,
              child: _buildSlide(),
            ),
          ),
        ],
      );

      _buildSlideV2() {
       return PageView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
          return ProductImageTile(
                    data: ProductImage(image: image_popular_product_1),
                    onItemPressed: (item) {
                      item.isSelected = !item.isSelected;
                    },
                  );
        },);
      }

      _buildSlide() => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ProductImageTile(
                    data: ProductImage(image: image_popular_product_1),
                    onItemPressed: (item) {
                      item.isSelected = !item.isSelected;
                    },
                  );
                },
              );

  _buildProductInfoArea() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
        width: context.width,
        height: context.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Wireless Controller for PS4',
              style: context.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: context.bodyMedium?.copyWith(
                color: textColorGrey,
                height: 1.5,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'See more detail',
                  style: context.bodyMedium?.copyWith(color: context.primary),
                ),
                Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: context.primary,
                ),
              ],
            ),
            const Spacer(),
            const Button(text: 'Add to cart'),
          ],
        ),
      );
}
