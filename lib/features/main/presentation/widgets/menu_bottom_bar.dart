import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/themes/themes.dart';
import '../bloc/main_cubit.dart';

class MenuBottomBar extends StatelessWidget {
  const MenuBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          items: ReadContext(context).read<MainCubit>().menuBottomBarItems,
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
          onTap: ReadContext(context).read<MainCubit>().setCurrentIndex,
        );
      },
    );
  }
}
