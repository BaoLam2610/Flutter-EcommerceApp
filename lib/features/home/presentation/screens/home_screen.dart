import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../app/presentation/widgets/home_app_bar.dart';

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
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [const HomeAppBar()];
        },
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(100, (index) => const Text('Hello')),
          ),
        ),
      ),
    );
  }
}
