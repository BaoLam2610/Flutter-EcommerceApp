import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/themes/themes.dart';
import '../bloc/main_cubit.dart';

class MenuBottomBar extends StatelessWidget {
  final MainCubit _cubit;

  const MenuBottomBar(this._cubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: _cubit,
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          items: _cubit.menuBottomBarItems,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.current.primary,
          unselectedItemColor: AppColors.current.secondary,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: AppTextStyles.bold12.copyWith(
            color: AppColors.current.primary,
          ),
          unselectedLabelStyle: AppTextStyles.regular12.copyWith(
            color: AppColors.current.secondary,
          ),
          onTap: _cubit.setCurrentIndex,
        );
      },
    );
  }
}
