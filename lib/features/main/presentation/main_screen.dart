import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import 'bloc/main_cubit.dart';
import 'widgets/menu_bottom_bar.dart';

class MainScreen extends BaseScreen {
  const MainScreen({super.key});

  @override
  BaseScreenState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends BaseScreenState<MainScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBottomBar(
        ReadContext(context).read<MainCubit>(),
      ),
      body: _buildBody,
    );
  }

  Widget get _buildBody => BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          return ReadContext(context)
              .read<MainCubit>()
              .widgets[state.currentIndex];
        },
      );
}
