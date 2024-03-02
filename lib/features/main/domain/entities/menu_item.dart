import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/configs.dart';
import '../../../../gen/gen.dart';

enum MenuItemType { home, category, store, notification, profile }

extension MenuItemTypeExtension on MenuItemType {
  String get unselectedIconPath {
    switch (this) {
      case MenuItemType.home:
        return Assets.icons.icHomeOutline.path;
      case MenuItemType.category:
        return Assets.icons.icCategoryOutline.path;
      case MenuItemType.store:
        return Assets.icons.icStoreOutline.path;
      case MenuItemType.notification:
        return Assets.icons.icNotificationOutline.path;
      case MenuItemType.profile:
        return Assets.icons.icProfileOutline.path;
    }
  }

  String get selectedIconPath {
    switch (this) {
      case MenuItemType.home:
        return Assets.icons.icHomeSolid.path;
      case MenuItemType.category:
        return Assets.icons.icCategorySolid.path;
      case MenuItemType.store:
        return Assets.icons.icStoreSolid.path;
      case MenuItemType.notification:
        return Assets.icons.icNotificationSolid.path;
      case MenuItemType.profile:
        return Assets.icons.icProfileSolid.path;
    }
  }

  String get label {
    switch (this) {
      case MenuItemType.home:
        return LocaleKeys.home.tr();
      case MenuItemType.category:
        return LocaleKeys.category.tr();
      case MenuItemType.store:
        return LocaleKeys.store.tr();
      case MenuItemType.notification:
        return LocaleKeys.notification.tr();
      case MenuItemType.profile:
        return LocaleKeys.profile.tr();
    }
  }

  Widget get selectedIcon {
    return SvgPicture.asset(
      selectedIconPath,
      colorFilter: ColorFilter.mode(
        AppColors.current.primary,
        BlendMode.srcIn,
      ),
    );
  }

  Widget get unselectedIcon {
    return SvgPicture.asset(
      unselectedIconPath,
      colorFilter: ColorFilter.mode(
        AppColors.current.secondary,
        BlendMode.srcIn,
      ),
    );
  }

  BottomNavigationBarItem get bottomBarItem {
    return BottomNavigationBarItem(
      icon: unselectedIcon,
      label: label,
      activeIcon: selectedIcon,
    );
  }
}
