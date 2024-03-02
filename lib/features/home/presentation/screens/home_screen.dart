import 'package:flutter/material.dart';

import '../../../../core/widgets/screen/base_screen.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  BaseScreenState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Screen'),),
    );
  }
}
