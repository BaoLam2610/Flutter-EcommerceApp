import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/locale_keys.g.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(const IntroState());

  final List<Map<String, dynamic>> introList = [
    {
      AppStrings.text: LocaleKeys.intro_1.tr(),
      AppStrings.image: Assets.images.splash1.path,
    },
    {
      AppStrings.text: LocaleKeys.intro_2.tr(),
      AppStrings.image: Assets.images.splash2.path,
    },
    {
      AppStrings.text: LocaleKeys.intro_3.tr(),
      AppStrings.image: Assets.images.splash3.path,
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
}
