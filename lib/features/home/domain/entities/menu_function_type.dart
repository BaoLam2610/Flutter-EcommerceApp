import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/configs.dart';
import '../../../../gen/gen.dart';

enum MenuFunctionType {
  manual,
  brand,
  checkPrice,
  store,
  membershipCard,
  flashSale,
  discountCode,
  trademark,
}

extension MenuFunctionExtension on MenuFunctionType {
  String get label {
    switch (this) {
      case MenuFunctionType.manual:
        return LocaleKeys.manual;
      case MenuFunctionType.brand:
        return LocaleKeys.brand;
      case MenuFunctionType.checkPrice:
        return LocaleKeys.check_price;
      case MenuFunctionType.store:
        return LocaleKeys.store;
      case MenuFunctionType.membershipCard:
        return LocaleKeys.membership_card;
      case MenuFunctionType.flashSale:
        return LocaleKeys.flash_sale;
      case MenuFunctionType.discountCode:
        return LocaleKeys.discount_code;
      case MenuFunctionType.trademark:
        return LocaleKeys.trademark;
    }
  }

  String get iconPath {
    switch (this) {
      case MenuFunctionType.manual:
        return Assets.icons.icNewspaperSolid.path;
      case MenuFunctionType.brand:
        return Assets.icons.logoApp.path;
      case MenuFunctionType.checkPrice:
        return Assets.icons.icQrCode.path;
      case MenuFunctionType.store:
        return Assets.icons.icMapPinSolid.path;
      case MenuFunctionType.membershipCard:
        return Assets.icons.icCreditCardSolid.path;
      case MenuFunctionType.flashSale:
        return Assets.icons.icBoltSolid.path;
      case MenuFunctionType.discountCode:
        return Assets.icons.icTicketSolid.path;
      case MenuFunctionType.trademark:
        return Assets.icons.icShoppingBagSolid.path;
    }
  }

  Widget get icon {
    return SvgPicture.asset(
      iconPath,
      width: 24.r,
      height: 24.r,
      colorFilter: ColorFilter.mode(
        AppColors.current.background,
        BlendMode.srcIn,
      ),
    );
  }
}
