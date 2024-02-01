import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  BaseScreenState<BaseScreen> createState() => BaseScreenState();
}

class BaseScreenState<T extends BaseScreen> extends State<BaseScreen> {

  Widget buildScreen(BuildContext context) => Container();

  @override
  Widget build(BuildContext context) {
    AppColors.of(context);
    return buildScreen(context);
  }
}