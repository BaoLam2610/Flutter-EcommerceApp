import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../main/presentation/widgets/main_app_bar.dart';
import 'bloc/home_cubit.dart';
import 'home_body.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  BaseScreenState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (_, __) => [
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.cartBadgeCount != current.cartBadgeCount,
            builder: (context, state) => MainAppBar(
              cartBadgeCount: state.cartBadgeCount,
            ),
          ),
        ],
        body: const HomeBody(),
      ),
    );
  }
}
