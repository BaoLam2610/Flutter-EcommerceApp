import 'package:flutter/material.dart';

import '../../../../configs/themes/text_themes.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../domain/models/category.dart';
import '../../domain/models/popular_product.dart';
import '../../domain/models/special_offer.dart';
import '../widgets/aspect_ratio_image.dart';
import '../widgets/card_badge.dart';
import '../widgets/search_text_field.dart';
import 'components/category_tile.dart';
import 'components/popular_product_tile.dart';
import 'components/special_offer_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  _buildBody() => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            _buildSearchActionBar(),
            const SizedBox(height: 18),
            _buildDiscountSection(),
            const SizedBox(height: 18),
            _buildCategoriesSection(),
            const SizedBox(height: 18),
            _buildSpecialForYouSection(),
            const SizedBox(height: 18),
            _buildPopularProductSection(),
            _buildProductList()
          ],
        ),
      );

  _buildSearchActionBar() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Expanded(
              child: SearchTextField(
                hint: 'Search product',
              ),
            ),
            SizedBox(width: 10),
            CardBadge(icon: ic_card),
            SizedBox(width: 10),
            CardBadge(
              icon: ic_bell,
              badge: '10',
            ),
          ],
        ),
      );

  _buildDiscountSection() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue[900], borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'A Summer Surpise',
              style: context.bodySmall?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Cashback 20%',
              style: context.displayLarge?.copyWith(color: Colors.white),
            )
          ],
        ),
      );

  _buildCategoriesSection() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryTile(
              category: Category(icon: ic_flash, title: 'Flash Deal'),
            ),
            CategoryTile(
              category: Category(icon: ic_bill, title: 'Bill'),
            ),
            CategoryTile(
              category: Category(icon: ic_game, title: 'Game'),
            ),
            CategoryTile(
              category: Category(icon: ic_gift, title: 'Daily Gift'),
            ),
            CategoryTile(
              category: Category(icon: ic_discover, title: 'More'),
            ),
          ],
        ),
      );

  _buildSpecialForYouSection() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Special for you',
                  style: context.labelMedium,
                ),
                Text(
                  'See more',
                  style: context.bodySmall?.copyWith(
                    color: textColorLightGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SpecialOfferTile(
                    offer: SpecialOffer(
                      image: image_banner_2,
                      title: 'Smartphone',
                      totalBrands: 18,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      );

  _buildPopularProductSection() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Product',
                  style: context.labelMedium,
                ),
                Text(
                  'See more',
                  style: context.bodySmall?.copyWith(
                    color: textColorLightGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // SizedBox(width: 200, child: AspectRatioImage(image: image_popular_product_1),),

          // SizedBox(
          //   width: double.infinity,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return PopularProductTile(
          //         product: PopularProduct(
          //           image: image_popular_product_1,
          //           name: 'Product 1',
          //           price: 20,
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      );

  _buildProductList() => LimitedBox(
    maxHeight: 500,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return PopularProductTile(
            product: PopularProduct(
              image: image_popular_product_1,
              name: 'Product 1',
              price: 20,
            ),
          );
        }),
  );
}
