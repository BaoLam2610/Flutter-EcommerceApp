import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class StoreScreen extends BaseScreen {
  const StoreScreen({super.key});

  @override
  BaseScreenState<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends BaseScreenState<StoreScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Store Screen'),
      ),
    );
  }
}
