import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../main/presentation/widgets/app_bar/main_normal_app_bar.dart';
import 'bloc/category_cubit.dart';
import 'category_body.dart';

class CategoryScreen extends BaseScreen {
  const CategoryScreen({super.key});

  @override
  BaseScreenState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends BaseScreenState<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    ReadContext(context).read<CategoryCubit>().getCategories();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return const Scaffold(
      appBar: MainNormalAppBar(),
      body: CategoryBody(),
    );
  }
}
