import 'package:flutter/material.dart';

import '../../../../core/widgets/screen/base_screen.dart';

class CategoryScreen extends BaseScreen {
  const CategoryScreen({super.key});

  @override
  BaseScreenState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends BaseScreenState<CategoryScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Category Screen'),),
    );
  }
}
