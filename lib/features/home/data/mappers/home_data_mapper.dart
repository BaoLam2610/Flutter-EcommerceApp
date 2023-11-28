import '../../domain/models/category.dart';
import '../../domain/models/discount.dart';
import '../../domain/models/home_cart.dart';
import '../../domain/models/home_data.dart';
import '../../domain/models/home_notification.dart';
import '../../domain/models/popular_product.dart';
import '../../domain/models/special_offer.dart';
import '../remote/dto/cart/cart_dto.dart';
import '../remote/dto/category/category_dto.dart';
import '../remote/dto/discount/discount_dto.dart';
import '../remote/dto/home/home_dto.dart';
import '../remote/dto/notification/notification_dto.dart';
import '../remote/dto/popular_product/popular_product_dto.dart';
import '../remote/dto/special_offer/special_dto.dart';

extension HomeDataMapper on HomeDto {
  HomeData get toDomain => HomeData(
        discount: discount?.toDomain,
        categories: categories?.toDomain ?? [],
        specialOffers: specials?.toDomain ?? [],
        popularProducts: popularProducts?.toDomain ?? [],
        notification: notification?.toDomain ??
            HomeNotification(
              id: 'id',
              total: 0,
            ),
        cart: cart?.toDomain ??
            HomeCart(
              id: '',
              total: 0,
            ),
      );
}

extension HomeNotificationMapper on NotificationDto {
  HomeNotification get toDomain => HomeNotification(
        id: id ?? '',
        total: total ?? 0,
      );
}

extension HomeCartMapper on CartDto {
  HomeCart get toDomain => HomeCart(
        id: id ?? '',
        total: total ?? 0,
      );
}

extension DiscountMapper on DiscountDto {
  Discount get toDomain => Discount(
        id: id ?? '',
        title: title ?? '',
        description: description ?? '',
        image: image ?? '',
      );
}

extension CategoryMapper on CategoryDto {
  Category get toDomain => Category(
        icon: icon ?? '',
        title: title ?? '',
      );
}

extension CategoriesMapper on List<CategoryDto> {
  List<Category> get toDomain => map((e) => e.toDomain).toList();
}

extension SpecialOfferMapper on SpecialOfferDto {
  SpecialOffer get toDomain => SpecialOffer(
        image: image ?? '',
        title: title ?? '',
        totalBrands: totalBrands ?? 0,
      );
}

extension SpecialOffersMapper on List<SpecialOfferDto> {
  List<SpecialOffer> get toDomain => map((e) => e.toDomain).toList();
}

extension PopularProductMapper on PopularProductDto {
  PopularProduct get toDomain => PopularProduct(
        id: id ?? '',
        image: image ?? '',
        name: name ?? '',
        price: price ?? 0,
      );
}

extension PopularProductsMapper on List<PopularProductDto> {
  List<PopularProduct> get toDomain => map((e) => e.toDomain).toList();
}
