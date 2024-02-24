import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/locale_keys.g.dart';
import '../../../../../configs/di/injection_container.dart';
import '../../../../app/domain/usecases/first_open_app/save_first_open_app.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  final PageController pageController = PageController();

  final _saveFirstOpenAppUseCase = inject.get<SaveFirstOpenAppUseCase>();

  IntroCubit() : super(const IntroState());

  final List<Map<String, dynamic>> introList = [
    {
      AppKeys.text: LocaleKeys.intro_1.tr(),
      AppKeys.image: Assets.images.splash1.path,
    },
    {
      AppKeys.text: LocaleKeys.intro_2.tr(),
      AppKeys.image: Assets.images.splash2.path,
    },
    {
      AppKeys.text: LocaleKeys.intro_3.tr(),
      AppKeys.image: Assets.images.splash3.path,
    },
  ];

  int get currentIndex => state.currentIndex;

  void updateCurrentPage(int index) {
    emit(
      state.copyWith(
        currentIndex: index,
      ),
    );
  }

  void increaseCurrentPage() {
    int page = 0;
    if (state.currentIndex != introList.length - 1) {
      page = state.currentIndex + 1;
    }
    emit(state.copyWith(currentIndex: page));
    _onChangePage();
  }

  void _onChangePage() {
    pageController.animateToPage(
      state.currentIndex,
      duration: AppDurations.delayPagerIndicator,
      curve: Curves.easeInOut,
    );
  }

  void onSaveFirstOpenApp() async {
    await _saveFirstOpenAppUseCase.call();
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
