import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../main/presentation/widgets/app_bar/main_app_bar.dart';
import '../../../main/presentation/widgets/app_bar/main_normal_app_bar.dart';
import 'category_body.dart';

class CategoryScreen extends BaseScreen {
  const CategoryScreen({super.key});

  @override
  BaseScreenState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends BaseScreenState<CategoryScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return const Scaffold(
      appBar: MainNormalAppBar(),
      body: CategoryBody()
    );
  }
}
