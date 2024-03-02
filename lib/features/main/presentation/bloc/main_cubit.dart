import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../category/category.dart';
import '../../../home/home.dart';
import '../../../notification/notification.dart';
import '../../../profile/profile.dart';
import '../../../store/store.dart';
import '../../domain/entities/menu_item.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  final List<Widget> widgets = [
    const HomeProvider(),
    const CategoryProvider(),
    const StoreProvider(),
    const NotificationProvider(),
    const ProfileProvider()
  ];

  final menuBottomBarItems = [
    MenuItemType.home.bottomBarItem,
    MenuItemType.category.bottomBarItem,
    MenuItemType.store.bottomBarItem,
    MenuItemType.notification.bottomBarItem,
    MenuItemType.profile.bottomBarItem,
  ];

  void setCurrentIndex(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
