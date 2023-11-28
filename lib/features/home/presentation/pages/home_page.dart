import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/themes/text_themes.dart';
import '../../../../core/bloc/bloc_state.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../domain/models/category.dart';
import '../../domain/models/discount.dart';
import '../../domain/models/home_data.dart';
import '../../domain/models/popular_product.dart';
import '../../domain/models/special_offer.dart';
import '../widgets/card_badge.dart';
import '../widgets/search_text_field.dart';
import 'bloc/home_bloc.dart';
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
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const GetHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  _buildBody() => BlocBuilder<HomeBloc, BlocState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is Error) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is Success<HomeData>) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  _buildSearchActionBar(),
                  const SizedBox(height: 18),
                  _buildDiscountSection(state.data!.discount),
                  const SizedBox(height: 18),
                  _buildCategoriesSection(state.data!.categories),
                  const SizedBox(height: 18),
                  _buildSpecialForYouSection(state.data!.specialOffers),
                  const SizedBox(height: 18),
                  _buildPopularProductSection(state.data!.popularProducts),
                ],
              ),
            );
          }
          return const SizedBox();
        },
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

  _buildDiscountSection(Discount? discount) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue[900], borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              discount?.title ?? '',
              style: context.bodySmall?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              discount?.description ?? '',
              style: context.displayLarge?.copyWith(color: Colors.white),
            )
          ],
        ),
      );

  _buildCategoriesSection(List<Category> categories) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < categories.length; i++) ...[
              CategoryTile(
                data: Category(
                  icon: categories[i].icon,
                  title: categories[i].title,
                ),
              ),
            ],
          ],
        ),
      );

  _buildSpecialForYouSection(List<SpecialOffer> specialOffers) => Column(
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
              itemCount: specialOffers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SpecialOfferTile(data: specialOffers[index]),
                );
              },
            ),
          )
        ],
      );

  _buildPopularProductSection(List<PopularProduct> popularProducts) => Column(
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
          LimitedBox(
            maxHeight: 315,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: popularProducts.length,
                itemBuilder: (context, index) {
                  return PopularProductTile(
                    position: index,
                    data: popularProducts[index],
                    onFavoritePressed: (indexPressed) {
                      popularProducts[indexPressed].isFavorite =
                          !popularProducts[indexPressed].isFavorite;
                    },
                  );
                }),
          ),
        ],
      );
}
