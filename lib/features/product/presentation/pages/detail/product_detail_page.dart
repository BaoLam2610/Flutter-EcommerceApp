import 'package:flutter/material.dart';

import '../../../../../core/constants/icons.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../../../core/widgets/ui/rounded_icon_card.dart';
import '../../../../home/presentation/widgets/aspect_ratio_image.dart';
import '../../../domain/models/product.dart';
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
      backgroundColor: context.background,
      body: _buildBody(),
    );
  }

  _buildBody() => SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: _buildProductImageArea(),
            ),
            const Expanded(child: SizedBox())
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
              height: 100,
              width: context.width * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const ProductImageTile(data: image_popular_product_1);
                },
              ),
            ),
          ),
        ],
      );
}
