import 'category.dart';
import 'discount.dart';
import 'home_cart.dart';
import 'home_notification.dart';
import 'popular_product.dart';
import 'special_offer.dart';

class HomeData {
  final Discount? discount;
  final List<Category> categories;
  final List<SpecialOffer> specialOffers;
  final List<PopularProduct> popularProducts;
  final HomeNotification notification;
  final HomeCart cart;
  HomeData({
    this.discount,
    required this.categories,
    required this.specialOffers,
    required this.popularProducts,
    required this.notification,
    required this.cart,
  });
}
